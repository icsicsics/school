import 'package:flutter/material.dart';
import 'package:schools/presentation/screens/authentication/login/login_screen.dart';
import 'package:schools/presentation/screens/channels/channels_screen.dart';
import 'package:schools/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:schools/presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = "/";
  static const String onBoarding = "/onBoarding";
  static const String channels = "/channels";
  static const String login = "/login";
  static const String home = "/home";

  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _materialRoute(const SplashScreen());
      case onBoarding:
        return _materialRoute(const OnBoardingScreen());
      case channels:
        return _materialRoute(const ChannelsScreen());
      case login:
        return _materialRoute(const LoginScreen());
      case home:
        return _materialRoute(const LoginScreen());

      default:
        //TODO(1) Replace With default Screen
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
