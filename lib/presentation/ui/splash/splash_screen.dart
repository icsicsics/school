import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/presentation/bloc/splash/splash_bloc.dart';
import 'package:schools/presentation/ui/authentication/login/login_screen.dart';
import 'package:schools/presentation/ui/splash/widgets/splash_content_widget.dart';

class SplashScreen extends BaseStatefulWidget {
  const SplashScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  SplashBloc get _bloc => BlocProvider.of<SplashBloc>(context);

  @override
  void initState() {
    _bloc.add(SplashGetTokenEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashLoadingState) {
          showLoading();
        } else if (state is SplashGetTokenSuccessState) {
          _bloc.add(SplashSaveTokenEvent(token: state.response.data!.token!));
        } else if (state is SplashSaveTokenSuccessState) {
          hideLoading();
          _navigationToLoginScreen();
        }
      },
      builder: (context, state) {
        return const SplashContentWidget();
      },
    );
  }

  void _navigationToLoginScreen() => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => const LoginScreen(isFather: false)));
}
