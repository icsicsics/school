import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/bloc/my_child_points/my_child_points_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/home/home_screen.dart';
import 'package:schools/presentation/ui/my_child_point/widget/my_child_content_widget.dart';
import 'package:schools/presentation/ui/my_children/my_children_screen.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';

class MyChildPointsScreen extends BaseStatefulWidget {
  const MyChildPointsScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _MyChildPointsScreenState();
}

class _MyChildPointsScreenState extends BaseState<MyChildPointsScreen> {
  MyChildPointsBloc get _bloc => BlocProvider.of<MyChildPointsBloc>(context);

  @override
  Widget baseBuild(BuildContext context) {
    return BlocListener<MyChildPointsBloc, MyChildPointsState>(
      listener: (context, state) {
        if (state is OpenPointScreenState) {
          _openPointScreen();
        } else if (state is NavigateToHomeScreenState) {
          _navigateHomeScreen();
        } else if (state is NavigateToNotificationScreenState) {
          _navigateToNotificationScreen();
        }
      },
      child: Scaffold(
          backgroundColor: ColorsManager.whiteColor,
          appBar: _appBar(),
          body: MyChildContentWidget(
            bloc: _bloc,
          )),
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,
              color: ColorsManager.secondaryColor, size: 25),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => _bloc.add(NavigateToNotificationScreenEvent()),
            icon: const Icon(Icons.notifications_active,
                color: ColorsManager.secondaryColor, size: 25),
          ),
        ],
        title: const BoldTextWidget(
            color: ColorsManager.secondaryColor,
            fontSize: 20,
            text: "Students Profile"),
      );

  void _openPointScreen() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const MyChildrenScreen()));

  void _navigateHomeScreen() => Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (_) => const HomeScreen()), (route) => false);

  void _navigateToNotificationScreen() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
      (route) => false);
}
