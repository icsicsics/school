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
  bool isHomes = false;
  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<MyChildrenBloc, MyChildrenState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(state is MyChildrenShowHousesState){
          isHomes=state.isShowHouses;
        }
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
            onPressed: () {},
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
    return Visibility(
      visible: isHomes,
      child: InkWell(
        onTap: () {},
        child: Card(
            color: ColorsManager.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side:
                    const BorderSide(width: 2, color: ColorsManager.grayColor)),
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
                      child:
                          const Icon(Icons.star, color: ColorsManager.yellow)),
                ))),
      ),
    );
  }
}
