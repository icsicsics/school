import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/side_menu_content_widget.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: BlocConsumer<SideMenuBloc, SideMenuState>(
          listener: (context, state) {
            if (state is SideMenuHomeState) {
              _onSideMenuHomeState();
            } else if (state is SideMenuSettingsState) {
              _onSideMenuSettingsState();
            } else if (state is SideMenuContactUsState) {
              _onSideMenuContactUsState();
            } else if (state is SideMenuAboutAppState) {
              _onSideMenuAboutAppState();
            }
          },
          builder: (context, state) {
            return const SideMenuContentWidget();
          },
        ));
  }

  void _onSideMenuHomeState() {}

  void _onSideMenuSettingsState() {}

  void _onSideMenuContactUsState() {}

  void _onSideMenuAboutAppState() {}
}
