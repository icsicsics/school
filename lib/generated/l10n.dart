// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `اب`
  String get isFather {
    return Intl.message(
      'اب',
      name: 'isFather',
      desc: '',
      args: [],
    );
  }

  /// `AR`
  String get arabic {
    return Intl.message(
      'AR',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `EN`
  String get english {
    return Intl.message(
      'EN',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Interactive School Counselling`
  String get interactiveSchoolCounselling {
    return Intl.message(
      'Interactive School Counselling',
      name: 'interactiveSchoolCounselling',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Phone Number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your Phone Number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get sendOTP {
    return Intl.message(
      'Send OTP',
      name: 'sendOTP',
      desc: '',
      args: [],
    );
  }

  /// `Change Mobile Number`
  String get changeMobileNumber {
    return Intl.message(
      'Change Mobile Number',
      name: 'changeMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// ` Next`
  String get next {
    return Intl.message(
      ' Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// ` I have read and accept the`
  String get ihaveReadAndAcceptThe {
    return Intl.message(
      ' I have read and accept the',
      name: 'ihaveReadAndAcceptThe',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Term of Use`
  String get termOfUse {
    return Intl.message(
      'Term of Use',
      name: 'termOfUse',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message(
      'and',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Didn't Receive Verification code ?`
  String get didntReceiveVerificationCode {
    return Intl.message(
      'Didn\'t Receive Verification code ?',
      name: 'didntReceiveVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Send it again`
  String get sendItAgain {
    return Intl.message(
      'Send it again',
      name: 'sendItAgain',
      desc: '',
      args: [],
    );
  }

  /// `Verify your Number`
  String get verifyYourNumber {
    return Intl.message(
      'Verify your Number',
      name: 'verifyYourNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please type verification code sent to your\nphone`
  String get pleaseTypeVerificationCodeSentToYourPhone {
    return Intl.message(
      'Please type verification code sent to your\nphone',
      name: 'pleaseTypeVerificationCodeSentToYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Sections`
  String get sections {
    return Intl.message(
      'Sections',
      name: 'sections',
      desc: '',
      args: [],
    );
  }

  /// `Class houses`
  String get classHouses {
    return Intl.message(
      'Class houses',
      name: 'classHouses',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Interactive school guidance`
  String get interactiveSchoolGuidance {
    return Intl.message(
      'Interactive school guidance',
      name: 'interactiveSchoolGuidance',
      desc: '',
      args: [],
    );
  }

  /// `Add a Point`
  String get addPoint {
    return Intl.message(
      'Add a Point',
      name: 'addPoint',
      desc: '',
      args: [],
    );
  }

  /// `My Children`
  String get myChildren {
    return Intl.message(
      'My Children',
      name: 'myChildren',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Me`
  String get me {
    return Intl.message(
      'Me',
      name: 'me',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Inbox`
  String get inbox {
    return Intl.message(
      'Inbox',
      name: 'inbox',
      desc: '',
      args: [],
    );
  }

  /// `Student houses`
  String get studentHouses {
    return Intl.message(
      'Student houses',
      name: 'studentHouses',
      desc: '',
      args: [],
    );
  }

  /// `Honesty`
  String get honesty {
    return Intl.message(
      'Honesty',
      name: 'honesty',
      desc: '',
      args: [],
    );
  }

  /// `Collaboration`
  String get collaboration {
    return Intl.message(
      'Collaboration',
      name: 'collaboration',
      desc: '',
      args: [],
    );
  }

  /// `Weather`
  String get weather {
    return Intl.message(
      'Weather',
      name: 'weather',
      desc: '',
      args: [],
    );
  }

  /// `Points`
  String get points {
    return Intl.message(
      'Points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `School Homes`
  String get schoolHomes {
    return Intl.message(
      'School Homes',
      name: 'schoolHomes',
      desc: '',
      args: [],
    );
  }

  /// `All Points`
  String get allPoints {
    return Intl.message(
      'All Points',
      name: 'allPoints',
      desc: '',
      args: [],
    );
  }

  /// `This Week`
  String get thisWeek {
    return Intl.message(
      'This Week',
      name: 'thisWeek',
      desc: '',
      args: [],
    );
  }

  /// `Students Profile`
  String get studentsProfile {
    return Intl.message(
      'Students Profile',
      name: 'studentsProfile',
      desc: '',
      args: [],
    );
  }

  /// `Energetic`
  String get energetic {
    return Intl.message(
      'Energetic',
      name: 'energetic',
      desc: '',
      args: [],
    );
  }

  /// `Initiative`
  String get initiative {
    return Intl.message(
      'Initiative',
      name: 'initiative',
      desc: '',
      args: [],
    );
  }

  /// `Father Of`
  String get fatherOf {
    return Intl.message(
      'Father Of',
      name: 'fatherOf',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Teachers`
  String get teachers {
    return Intl.message(
      'Teachers',
      name: 'teachers',
      desc: '',
      args: [],
    );
  }

  /// `Students`
  String get students {
    return Intl.message(
      'Students',
      name: 'students',
      desc: '',
      args: [],
    );
  }

  /// `Interactive`
  String get interactive {
    return Intl.message(
      'Interactive',
      name: 'interactive',
      desc: '',
      args: [],
    );
  }

  /// `Appreciative`
  String get appreciative {
    return Intl.message(
      'Appreciative',
      name: 'appreciative',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get aboutApp {
    return Intl.message(
      'About App',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Reward`
  String get reward {
    return Intl.message(
      'Reward',
      name: 'reward',
      desc: '',
      args: [],
    );
  }

  /// `Choose Why Leen Deserve this point`
  String get chooseWhyLeenDeserveThisPoint {
    return Intl.message(
      'Choose Why Leen Deserve this point',
      name: 'chooseWhyLeenDeserveThisPoint',
      desc: '',
      args: [],
    );
  }

  /// `Type Why Leen Deserve this point`
  String get typeWhyLeenDeserveThisPoint {
    return Intl.message(
      'Type Why Leen Deserve this point',
      name: 'typeWhyLeenDeserveThisPoint',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure ?`
  String get areYouSure {
    return Intl.message(
      'Are you sure ?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `We have send the code verification to Your Mobile`
  String get weHaveSendTheCodeVerificationToYourMobile {
    return Intl.message(
      'We have send the code verification to Your Mobile',
      name: 'weHaveSendTheCodeVerificationToYourMobile',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Don't Receive Code ? `
  String get dontReceiveCode {
    return Intl.message(
      'Don\'t Receive Code ? ',
      name: 'dontReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Ejabi`
  String get ejabi {
    return Intl.message(
      'Ejabi',
      name: 'ejabi',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
