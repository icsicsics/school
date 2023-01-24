import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
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
  bool _isFather = false;

  @override
  void initState() {
  _bloc.add(GetIsFatherEvent());
    super.initState();
  }
  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<MyChildrenBloc, MyChildrenState>(
      listener: (context, state) {
        if (state is OpenAddPointAlertState) {
          _openAddPointAlert();
        } else if (state is NavigateToNotificationScreenState) {
          _navigateToNotificationScreen();
        }   else if (state is GetIsFatherState) {
          _isFather = state.isFather;
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
          InkWell(
            onTap: ()=>_bloc.add(NavigateToNotificationScreenEvent()),
            child: SizedBox(
                width: 50,
                height: 50,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Visibility(
                        visible: _isFather == false,
                        child: const Icon(
                          Icons.mail,
                          color: ColorsManager.secondaryColor,
                          size: 25,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Visibility(
                          visible: _isFather,
                          child: const Icon(
                            Icons.mail,
                            color: ColorsManager.secondaryColor,
                            size: 25,
                          ),
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Visibility(
                          visible:_isFather,
                          child: const Icon(
                            Icons.notifications,
                            color: ColorsManager.yellow,
                            size: 24,
                          ),
                        )),
                  ],
                )),
          ),
        ],
        title:  BoldTextWidget(
            color: ColorsManager.secondaryColor,
            fontSize: 20,
            text: _isFather==false ?S.of(context).studentsProfile: S.of(context).myChildren),
      );

  Widget _points() {
    return InkWell(
      onTap: () => _bloc.add(OpenAddPointAlertEvent()),
      child: Container(
          height: 35,
          width: 35,
          decoration:  BoxDecoration(
              color: ColorsManager.whiteColor,
              border: Border.all(color: ColorsManager.grayColor,width: 1),
              borderRadius:
              const BorderRadius.all(Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(50))),
              child:  Container(
                height: 20,
                width: 20,
                color: Colors.transparent,
                child: SvgPicture.asset(ImagesPath.star, height: 25, width: 25),
              ),
            ),
          )),
    );
  }

  void _openAddPointAlert() => showAddPointFunction(
      context: context,
      addAction: () {
        Navigator.pop(context);
      },
      childName: "",
      commentController: _commentController, token: '', classroomId: '');

  void _navigateToNotificationScreen() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
      (route) => false);
}
