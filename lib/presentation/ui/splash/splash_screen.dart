import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/login/login_screen.dart';

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
  Widget baseBuild(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          ColorsManager.primaryColor,
          ColorsManager.secondaryColor,
        ],
        stops: [0.1, 1.0],
      )),
      height: MediaQuery.of(context).size.height / 3,
      child: const Center(
          child: BoldTextWidget(
        text: 'Test',
        fontSize: 20,
        color: ColorsManager.whiteColor,
      )),
    );
  }

  void _navigationToLoginScreen() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen())));
  }
}
