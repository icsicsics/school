import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/presentation/bloc/splash/splash_bloc.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/ui/authentication/login/login_screen.dart';
import 'package:schools/presentation/ui/home/home_screen.dart';
import 'package:schools/presentation/ui/splash/widgets/splash_content_widget.dart';

class SplashScreen extends BaseStatefulWidget {
  const SplashScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  SplashBloc get _bloc => BlocProvider.of<SplashBloc>(context);
  bool _isFather = false;

  @override
  void initState() {
    _bloc.add(GetIsFatherEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashLoadingState) {
          showLoading();
        } else if (state is SplashGetTokenSuccessState) {
          _bloc.add(SplashSaveTokenEvent(
              token: state.response.data!.token!.accessToken!));
        } else if (state is SplashSaveTokenSuccessState) {
          hideLoading();
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
          );
          _bloc.add(GetIsFatherEvent());
        } else if (state is GetIsFatherState) {
          _isFather = state.isFather;
          _bloc.add(GetTokenEvent());
        } else if (state is SplashGetTokenErrorState) {
          _onSplashGetTokenErrorState(state.error);
        } else if (state is GetTokenState) {
          if (state.token.isEmpty) {
            Future.delayed(Duration(microseconds: 2500)).then((value) {
              _navigationToLoginScreen(_isFather);
            });
          } else {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return const HomeScreen();
            }), (route) => false);
          }
        }
      },
      builder: (context, state) {
        return const SplashContentWidget();
      },
    );
  }

  void _onSplashGetTokenErrorState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  void _navigationToLoginScreen(bool isFather) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen(isFather: isFather)));
}
