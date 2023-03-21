import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_stateful_widget.dart';
import 'package:schools/presentation/bloc/splash/splash_bloc.dart';
import 'package:schools/presentation/screens/authentication/login/login_screen.dart';
import 'package:schools/presentation/screens/home/home_screen.dart';
import 'package:schools/presentation/screens/splash/widgets/splash_content_widget.dart';

class SplashScreen extends BaseStatefulWidget {
  const SplashScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  SplashBloc get _bloc => BlocProvider.of<SplashBloc>(context);

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is GetTokenState) {
          if (state.token.isEmpty) {
            _navigationToLoginScreen();
          } else {
            _navigateToHomeScreen();
          }
        }
      },
      builder: (context, state) {
        return const SplashContentWidget();
      },
    );
  }

  void _init() {
    _setStatusBarStyle();
    _getTokenEvent();
  }

  void _setStatusBarStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  void _getTokenEvent() {
    _bloc.add(GetTokenEvent());
  }

  void _navigateToHomeScreen() async {
    await _delay(3);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    }), (route) => false);
  }

  void _navigationToLoginScreen() async {
    await _delay(3);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => LoginScreen(),
      ),
    );
  }

  Future<void> _delay(int seconds) async =>
      await Future.delayed(Duration(seconds: seconds));
}
