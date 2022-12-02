import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/side_menu_content_widget.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Drawer(
        backgroundColor: Colors.white, child: SideMenuContentWidget());
  }
}
