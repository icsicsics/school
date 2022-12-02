import 'package:flutter/material.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/presentation/ui/authuntication/login/widgets/login_content_widget.dart';

class LoginScreen extends BaseStatefulWidget {
  const LoginScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return const Scaffold(
      body: LoginContentWidget(),
    );
  }
}
