import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:schools/presentation/ui/home/home_screen.dart';
import 'package:schools/presentation/ui/profile/profile_screen.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/side_menu_content_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/curve_Left_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/curve_right_widget.dart';

class SideMenuScreen extends StatefulWidget {
  final bool isComFromHome;

  const SideMenuScreen({Key? key, required this.isComFromHome})
      : super(key: key);

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  SideMenuBloc get _bloc => BlocProvider.of<SideMenuBloc>(context);

  @override
  void initState() {
    _bloc.add(GetLanguageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _language = '';
    return BlocConsumer<SideMenuBloc, SideMenuState>(
      listener: (context, state) {
        if (state is SideMenuHomeState) {
          _onSideMenuHomeState(context);
        } else if (state is SideMenuUserProfileState) {
          _onSideMenuProfileState(context);
        } else if (state is SideMenuContactUsState) {
          _onSideMenuContactUsState(context);
        } else if (state is SideMenuAboutAppState) {
          _onSideMenuAboutAppState(context);
        } else if (state is GetLanguageSuccessState) {
          _language = state.language;
        }
      },
      builder: (context, state) {
        return _language == "en"
            ? CurveLeftWidget(
                child: SideMenuContentWidget(
                language: _language,
              ))
            : CurveRightWidget(
                child: SideMenuContentWidget(
                language: _language,
              ));
      },
    );
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
}
