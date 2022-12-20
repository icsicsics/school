import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/add_point/widgets/add_point_content_widget.dart';
import 'package:schools/presentation/ui/my_children/my_children_screen.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';

class AddPointScreen extends BaseStatefulWidget {
  const AddPointScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _AddPointScreen();
}

class _AddPointScreen extends BaseState<AddPointScreen> {
  AddPointBloc get _addPointBloc => BlocProvider.of<AddPointBloc>(context);

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: _appBar(),
      body: BlocListener<AddPointBloc, AddPointState>(
        listener: (context, state) {
          if (state is NavigateToNotificationScreenState) {
            _navigateToNotificationScreen();
          } else if (state is NavigateToMyChildrenScreenState) {
            _navigateToMyChildrenScreen();
          }
        },
        child: AddPointContentWidget(
          addPointBloc: _addPointBloc,
        ),
      ),
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
            onPressed: () => BlocProvider.of<AddPointBloc>(context)
                .add(NavigateToNotificationScreenEvent()),
            icon: const Icon(Icons.mail_lock,
                color: ColorsManager.secondaryColor, size: 25),
          ),
        ],
        title: const BoldTextWidget(
            color: ColorsManager.secondaryColor,
            fontSize: 20,
            text: "Add Point"),
      );

  void _navigateToNotificationScreen() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
      (route) => false);

  void _navigateToMyChildrenScreen() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const MyChildrenScreen()));
}
