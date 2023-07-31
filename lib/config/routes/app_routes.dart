import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/channels/channels_data.dart';
import 'package:schools/presentation/screens/authentication/login/login_screen.dart';
import 'package:schools/presentation/screens/authentication/verify/verify_screen.dart';
import 'package:schools/presentation/screens/channels/channels_screen.dart';
import 'package:schools/presentation/screens/home/home_screen.dart';
import 'package:schools/presentation/screens/home/teacher_home_screen.dart';
import 'package:schools/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:schools/presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = "/";
  static const String onBoarding = "/onBoarding";
  static const String channels = "/channels";
  static const String login = "/login";
  static const String teacherHome = "/teacherHome";
  static const String home = "/home";
  static const String verify = "/verify";

  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _materialRoute(const SplashScreen());
      case onBoarding:
        return _materialRoute(const OnBoardingScreen());
      case channels:
        Map<String, dynamic> arg = settings.arguments as Map<String, dynamic>;

        return _materialRoute(ChannelsScreen(
          type: arg["type"] as String,
          videos: arg["videos"] as List<ChannelsData>,
        ));
      case login:
        return _materialRoute(const LoginScreen());
      case teacherHome:
        return _materialRoute(const TeacherHomeScreen());
      case home:
        return _materialRoute(const HomeScreen());
      case verify:
        Map<String, dynamic> arg = settings.arguments as Map<String, dynamic>;

        return _materialRoute(VerifyScreen(
          phoneNumber: (arg['phoneNumber'] as String),
          roles: (arg['roles'] as List<String>),
        ));

      default:
        //TODO(1) Replace With default Screen
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
