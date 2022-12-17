import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/ui/my_children/widget/my_children_content_widget.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';

class MyChildrenScreen extends BaseStatefulWidget {
  const MyChildrenScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _MyChildrenScreenState();
}

class _MyChildrenScreenState extends BaseState<MyChildrenScreen> {
  final TextEditingController _commentController = TextEditingController();

  MyChildrenBloc get _bloc => BlocProvider.of<MyChildrenBloc>(context);

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<MyChildrenBloc, MyChildrenState>(
      listener: (context, state) {
        if (state is OpenAddPointAlertState) {
          _openAddPointAlert();
        } else if (state is NavigateToNotificationScreenState) {
          _navigateToNotificationScreen();
        }
      },
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: _points(),
            appBar: _appBar(),
            body: const MyChildrenContentWidget());
      },
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
            text: "My Children"),
      );

  Widget _points() {
    return InkWell(
      onTap: () => _bloc.add(OpenAddPointAlertEvent()),
      child: Card(
          color: ColorsManager.whiteColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(width: 2, color: ColorsManager.grayColor)),
          elevation: 0,
          child: Padding(
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                height: 40,
                width: 40,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: ColorsManager.secondaryColor,
                    elevation: 0,
                    child: const Icon(Icons.star, color: ColorsManager.yellow)),
              ))),
    );
  }

  void _openAddPointAlert() => showAddPointFunction(
      context: context,
      addAction: () {
        Navigator.pop(context);
      },
      childName: "",
      commentController: _commentController);

  void _navigateToNotificationScreen() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
      (route) => false);
}
