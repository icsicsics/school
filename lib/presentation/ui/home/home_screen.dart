import 'package:flutter/material.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/presentation/ui/home/widgets/home_content_widget.dart';

class HomeScreen extends BaseStatefulWidget {
  const HomeScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return const Scaffold(
      body: HomeContentWidget(),
    );
  }
}
