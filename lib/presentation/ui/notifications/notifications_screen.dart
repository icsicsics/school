import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/data/source/remote/model/notification/request/notification_request.dart';
import 'package:schools/data/source/remote/model/notification/response/notifications_response.dart';
import 'package:schools/presentation/bloc/notifications/notifications_bloc.dart';
import 'package:schools/presentation/ui/notifications/widgets/notifications_content_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/side_menu_screen.dart';

class NotificationsScreen extends BaseStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends BaseState<NotificationsScreen> {
  NotificationsBloc get _bloc => BlocProvider.of<NotificationsBloc>(context);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool _isFather = false;
  String _language = '';
  String _token = '';
  List<NotificationItem> notifications = List.empty(growable: true);
  List<NotificationItem> inboxNotifications = List.empty(growable: true);

  @override
  void initState() {
    _bloc.add(GetIsFatherEvent());
    _bloc.add(GetLanguageEvent());
    _bloc.add(GetNotificationsEvent(
        notificationRequest: NotificationRequest(pageNo: 1, pageSize: 10)));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<NotificationsBloc, NotificationsState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetIsFatherState) {
          _isFather = state.isFather;
          if(_isFather){
            _bloc.add(GetInboxNotificationsEvent(
                notificationRequest: NotificationRequest(pageNo: 1, pageSize: 10)));
          }
        } else if (state is GetLanguageSuccessState) {
          _language = state.language;
          _bloc.add(GetTokenEvent());
        } else if (state is GetTokenSuccessState) {
          _token = state.token;
        } else if (state is GetNotificationsSuccessState) {
          notifications = state.notificationResponse.notificationItem ?? [];
        } else if (state is GetNotificationsFillState) {}
        else if (state is GetInboxNotificationsSuccessState) {
          inboxNotifications = state.notificationResponse.notificationItem ?? [];
        } else if (state is GetInboxNotificationsFillState) {}
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFFf6f2f2),
            drawer: SideMenuScreen(
              isComFromHome: false,
              language: _language,
              token: _token,
            ),
            key: _key,
            body: NotificationsContentWidget(
              globalKey: _key,
              isFather: _isFather,
              notifications : notifications,
              inboxNotifications : inboxNotifications,
            ));
      },
    );
  }
}
