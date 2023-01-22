import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/student_houses/student_houses_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/my_children/my_children_screen.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';
import 'package:schools/presentation/ui/student_houses/widgets/student_houses_content_widget.dart';

class StudentHousesScreen extends BaseStatefulWidget {
  const StudentHousesScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _AddPointScreen();
}

class _AddPointScreen extends BaseState<StudentHousesScreen> {
  StudentHousesBloc get _studentHousesBloc =>
      BlocProvider.of<StudentHousesBloc>(context);
  bool _isFather = false;

  @override
  void initState() {
    _studentHousesBloc.add(GetIsFatherEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: _appBar(),
      body: BlocListener<StudentHousesBloc, StudentHousesState>(
        listener: (context, state) {
          if (state is NavigateToNotificationScreenState) {
            _navigateToNotificationScreen();
          } else if (state is NavigateToMyChildrenScreenState) {
            _navigateToMyChildrenScreen();
          } else if (state is GetIsFatherState) {
            _isFather = state.isFather;
          }
        },
        child: StudentHousesContentWidget(
          studentHousesBloc: _studentHousesBloc,
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
          InkWell(
            onTap: () => BlocProvider.of<StudentHousesBloc>(context)
                .add(NavigateToNotificationScreenEvent()),
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
                          visible: _isFather,
                          child: const Icon(
                            Icons.notifications,
                            color: ColorsManager.yellow,
                            size: 24,
                          ),
                        )),
                  ],
                )),
          )
        ],
        title:  BoldTextWidget(
            color: ColorsManager.secondaryColor,
            fontSize: 20,
            text: _isFather==false?S.of(context).studentHouses:S.of(context).myChildren),
      );

  void _navigateToNotificationScreen() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
      (route) => false);

  void _navigateToMyChildrenScreen() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const MyChildrenScreen()));
}
