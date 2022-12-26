import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
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
          IconButton(
            onPressed: () => _bloc.add(NavigateToNotificationScreenEvent()),
            icon:  Icon(_isFather==false?Icons.mail_lock:Icons.notifications_active,
                color: ColorsManager.secondaryColor, size: 25),
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
              border: Border.all(color: Colors.grey,width: 1),
              borderRadius:
              const BorderRadius.all(Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: const BoxDecoration(
                  color: ColorsManager.starBackground,
                  borderRadius:
                  BorderRadius.all(Radius.circular(50))),
              child:  Container(
                  height: 20,
                  width: 20,
                  color: Colors.transparent,
                  child: Stack(
                    alignment: Alignment.center,
                    children: const [
                      Icon(Icons.star,
                          color: ColorsManager.whiteColor,
                          size: 25),
                      Icon(Icons.star,
                          color: ColorsManager.yellow, size: 19),
                    ],
                  ),
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
      commentController: _commentController);

  void _navigateToNotificationScreen() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
      (route) => false);
}
