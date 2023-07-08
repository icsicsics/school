import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/config/routes/app_routes.dart';
import 'package:schools/core/base/widget/base_stateful_widget.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/presentation/bloc/splash/splash_bloc.dart';
import 'package:schools/presentation/screens/authentication/login/login_screen.dart';
import 'package:schools/presentation/screens/channels/channels_screen.dart';
import 'package:schools/presentation/screens/home/home_screen.dart';
import 'package:schools/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:schools/presentation/screens/splash/widgets/splash_content_widget.dart';

class SplashScreen extends BaseStatefulWidget {
  const SplashScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  SplashBloc get _bloc => BlocProvider.of<SplashBloc>(context);
  bool isFather = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    isFather = await SharedPreferencesManager.getIsFather() ?? false;
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is GetTokenState) {
          if (state.token.isEmpty) {
            _bloc.add(GetShowOnBoardingEvent());
          } else {
            _bloc.add(NavigateToHomeScreenEvent());
          }
        } else if (state is GetShowOnBoardingState) {
          if (state.isShowOnBoarding == false) {
            _bloc.add(NavigateToOnBoardingScreenEvent());
          } else {
            _bloc.add(NavigateToChannelsScreenEvent());
          }
        } else if (state is NavigateToOnBoardingScreenState) {
          _navigateToOnBoardingScreen();
        } else if (state is NavigateToChannelsScreenState) {
          _navigationToChannelsScreen();
        } else if (state is NavigateToHomeScreenState) {
          _navigateToHomeScreen();
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

  void _navigateToHomeScreen() {
    if (isFather) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.teacherHome,
        (route) => false,
      );
    }
  }

  void _navigateToOnBoardingScreen() {
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.onBoarding,
    );
  }

  void _navigationToChannelsScreen() {
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.channels,
    );
  }
}
