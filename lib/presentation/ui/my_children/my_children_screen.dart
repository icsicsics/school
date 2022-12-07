import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/my_children/widget/my_children_content_widget.dart';

class MyChildrenScreen extends BaseStatefulWidget {
  const MyChildrenScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _MyChildrenScreenState();
}

class _MyChildrenScreenState extends BaseState<MyChildrenScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return  Scaffold(
      appBar: _appBar(),
      body: BlocConsumer<MyChildrenBloc, MyChildrenState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return const  MyChildrenContentWidget();
        },
      ),
    );
  }
  PreferredSizeWidget _appBar() => AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () =>Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios,
          color: ColorsManager.secondaryColor, size: 25),
    ),
    centerTitle: false,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_active,
            color: ColorsManager.secondaryColor, size: 25),
      ),
    ],
    title: const BoldTextWidget(
        color: ColorsManager.secondaryColor, fontSize: 20, text: "My Children"),
  );
}
