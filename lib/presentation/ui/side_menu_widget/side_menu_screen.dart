import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:schools/presentation/ui/about/about_screen.dart';
import 'package:schools/presentation/ui/my_children/my_children_screen.dart';
import 'package:schools/presentation/ui/profile/profile_screen.dart';
import 'package:schools/presentation/ui/school_houses/school_houses_screen.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/side_menu_content_widget.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.elliptical(0, 0),right: Radius.elliptical(180,500)),

      ),
        backgroundColor: Colors.white,
        child: BlocConsumer<SideMenuBloc, SideMenuState>(
          listener: (context, state) {
            if (state is SideMenuHomeState) {
              _onSideMenuHomeState(context);
            } else if (state is SideMenuSettingsState) {
              _onSideMenuSettingsState(context);
            } else if (state is SideMenuContactUsState) {
              _onSideMenuContactUsState(context);
            } else if (state is SideMenuAboutAppState) {
              _onSideMenuAboutAppState(context);
            }
          },
          builder: (context, state) {
            return const SideMenuContentWidget();
          },
        ));
  }

  void _onSideMenuHomeState(context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const SchoolHousesScreen()));

  void _onSideMenuSettingsState(context) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
  }

  void _onSideMenuContactUsState(context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const MyChildrenScreen()));

  void _onSideMenuAboutAppState(context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const AboutScreen()));
}