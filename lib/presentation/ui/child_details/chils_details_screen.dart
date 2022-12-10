import 'package:flutter/material.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/presentation/ui/child_details/widgets/child_details_content_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/side_menu_screen.dart';

class ChildDetailsScreen extends BaseStatefulWidget {
  const ChildDetailsScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _ChildDetailsScreenState();
}

class _ChildDetailsScreenState extends BaseState<ChildDetailsScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const SideMenuScreen(),
      body: ChildDetailsContentWidget(
        globalKey: _key,
      ),
    );
  }
}
