import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_logout_function.dart';
import 'package:schools/presentation/ui/authentication/login/login_screen.dart';
import 'package:schools/presentation/ui/home/home_screen.dart';
import 'package:schools/presentation/ui/profile/profile_screen.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/side_menu_content_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/curve.dart';

class SideMenuScreen extends StatefulWidget {
  final bool isComFromHome;
  final String language;

  const SideMenuScreen(
      {Key? key, required this.isComFromHome, required this.language})
      : super(key: key);

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  SideMenuBloc get _bloc => BlocProvider.of<SideMenuBloc>(context);
  bool _isFather = false;

  @override
  void initState() {
    _bloc.add(GetIsFatherEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: widget.language == "en"
            ? RPSCustomPainterLeft1()
            : RPSCustomPainterRight1(),
        child: Container(
            color: ColorsManager.yellow,
            child: ClipPath(
                clipper: widget.language == "en"
                    ? RPSCustomPainterLeft2()
                    : RPSCustomPainterRight2(),
                child: Container(
                    color: Colors.white,
                    child: BlocConsumer<SideMenuBloc, SideMenuState>(
                      listener: (context, state) {
                        if (state is SideMenuHomeState) {
                          _onSideMenuHomeState(context);
                        } else if (state is SideMenuUserProfileState) {
                          _onSideMenuProfileState(context);
                        } else if (state is SideMenuContactUsState) {
                          _onSideMenuContactUsState(context);
                        } else if (state is SideMenuAboutAppState) {
                          _onSideMenuAboutAppState(context);
                        } else if (state is GetIsFatherState) {
                          _isFather = state.isFather;
                        } else if (state is SwitchAccountState) {
                          _switchAccount(context);
                        } else if (state is LogoutState) {
                          showLogoutFunction(
                              context: context, yesAction: () => _logout());
                        }
                      },
                      builder: (context, state) {
                        return SideMenuContentWidget(
                          language: widget.language,
                          bloc: _bloc,
                        );
                      },
                    )))));
  }

  void _onSideMenuHomeState(context) {
    if (widget.isComFromHome == true) {
      Navigator.pop(context);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
          (route) => false);
    }
  }

  void _onSideMenuProfileState(context) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
  }

  void _onSideMenuContactUsState(context) {}

  void _onSideMenuAboutAppState(context) {}

  void _switchAccount(context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) =>
                LoginScreen(isFather: _isFather == true ? false : true)),
        (route) => false);
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) =>
                LoginScreen(isFather: _isFather == true ? false : true)),
            (route) => false);
  }
}
