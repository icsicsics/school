import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/presentation/ui/authentication/login/login_screen.dart';
import 'package:schools/presentation/ui/splash/widgets/splash_content_widget.dart';

class SplashScreen extends BaseStatefulWidget {
  const SplashScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  void initState() {
    _navigationToLoginScreen();
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) => const SplashContentWidget();

  void _navigationToLoginScreen() => Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginScreen())));
}
