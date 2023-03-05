import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

final didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final onNotificationClick = BehaviorSubject<String?>();

  String get androidNotificationChannelName => "Notification";

  String get androidNotificationChannelId => "Notification";

  Future initializeNotificationService() async {
    await _setupNotificationPermission();
    _configMessage();
    String token = await messaging.getToken() ?? "";
    print(token);
    await SharedPreferencesManager.setNotificationToken(
        (token));
  }

  FlutterLocalNotificationsPlugin get _getFlutterLocalNotificationsPlugin =>
      FlutterLocalNotificationsPlugin();

  Future<void> get _getFlutterLocalNotificationsPluginInitializer =>
      _getFlutterLocalNotificationsPlugin.initialize(_getInitializationSettings,
          onDidReceiveNotificationResponse: (notificationResponse) =>
              onNotificationClick.add(notificationResponse.payload));

  AndroidInitializationSettings get _getAndroidInitializationSettings =>
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  final DarwinInitializationSettings _initializationSettingsIOS =
      DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
          onDidReceiveLocalNotification: (
            int id,
            String? title,
            String? body,
            String? payload,
          ) async {
            didReceiveLocalNotificationSubject.add(
              ReceivedNotification(
                id: id,
                title: title,
                body: body,
                payload: payload,
              ),
            );
          });

  InitializationSettings get _getInitializationSettings =>
      InitializationSettings(
          android: _getAndroidInitializationSettings,
          iOS: _initializationSettingsIOS);

  Future _setupNotificationPermission() async {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  NotificationDetails get _getNotificationDetails => NotificationDetails(
      android: _getAndroidNotificationDetails, iOS: _getIOSNotificationDetails);

  DarwinNotificationDetails get _getIOSNotificationDetails =>
      const DarwinNotificationDetails();

  AndroidNotificationDetails get _getAndroidNotificationDetails =>
      AndroidNotificationDetails(
        androidNotificationChannelId,
        androidNotificationChannelName,
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        channelShowBadge: false,
        enableLights: true,
        autoCancel: true,
        enableVibration: true,
        channelAction: AndroidNotificationChannelAction.createIfNotExists,
        icon: '@mipmap/ic_launcher',
      );

  void _showNotificationAsLocal(
      {String? title, String? message, Map<String, dynamic>? data}) async {
    await _getFlutterLocalNotificationsPluginInitializer.whenComplete(() async {
      await _getFlutterLocalNotificationsPlugin.show(
          0, title, message, _getNotificationDetails,
          payload: json.encode(data));
    });
  }

  void _configMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      _setNotificationMessage(message, false);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      onNotificationClick.add(json.encode(message.data));
    });
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        onNotificationClick.add(json.encode(message.data));
      }
    });
  }

  void _setNotificationMessage(RemoteMessage message, bool isBackGround) {
    _showNotificationAsLocal(
        data: message.data,
        message: message.notification!.body,
        title: message.notification!.title);
  }

}
