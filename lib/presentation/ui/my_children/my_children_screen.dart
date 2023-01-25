import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/ui/my_children/widget/my_children_content_widget.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';

class MyChildrenScreen extends BaseStatefulWidget {
  final String studentId;
  final String language;
  final String classroomId;
  final String classroomSectionStudentsId;
  final bool isParent;

  const MyChildrenScreen(
      {super.key,
      required this.studentId,
      required this.language,
      required this.classroomId,
      required this.classroomSectionStudentsId,
      required this.isParent});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _MyChildrenScreenState();
}

class _MyChildrenScreenState extends BaseState<MyChildrenScreen> {
  TeacherStudentProfileInSchoolHouseResponse
      _teacherStudentProfileInSchoolHouseResponse =
      TeacherStudentProfileInSchoolHouseResponse();

  MyChildrenBloc get _bloc => BlocProvider.of<MyChildrenBloc>(context);
  bool _isFather = false;
  String _token = '';

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
          _openAddPointAlert(
              classroomId: widget.classroomId,
              classroomSectionStudentsId:widget.classroomSectionStudentsId.toString());
        } else if (state is NavigateToNotificationScreenState) {
          _navigateToNotificationScreen();
        } else if (state is GetIsFatherState) {
          _isFather = state.isFather;
          _bloc.add(GetTokenEvent());
        } else if (state is GetTokenSuccessState) {
          _token = state.token;
          _bloc.add(GetTeacherStudentProfileInSchoolHouseEvent(
              token: state.token, studentId: widget.studentId));
        } else if (state is GetMyChildrenLoadingState) {
          showLoading();
        } else if (state is GetTeacherStudentProfileInSchoolHouseSuccessState) {
          _teacherStudentProfileInSchoolHouseResponse = state.response;
          hideLoading();
        } else if (state is GetTeacherStudentProfileInSchoolHouseFailState) {
          _onGetTeacherStudentProfileInSchoolHouseFailState(state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: _points(),
            appBar: _appBar(),
            body: _teacherStudentProfileInSchoolHouseResponse.data != null
                ? MyChildrenContentWidget(
                    teacherStudentProfileInSchoolHouseResponse:
                        _teacherStudentProfileInSchoolHouseResponse)
                : Container());
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
            onTap: () => _bloc.add(NavigateToNotificationScreenEvent()),
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
          ),
        ],
        title: BoldTextWidget(
            color: ColorsManager.secondaryColor,
            fontSize: 20,
            text: _isFather == false
                ? S.of(context).studentsProfile
                : S.of(context).myChildren),
      );

  Widget _points() {
    return GestureDetector(
      onTap: () => _bloc.add(OpenAddPointAlertEvent()),
      child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
              border: Border.all(color: ColorsManager.grayColor, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Container(
                height: 20,
                width: 20,
                color: Colors.transparent,
                child: SvgPicture.asset(ImagesPath.star, height: 25, width: 25),
              ),
            ),
          )),
    );
  }

  void _openAddPointAlert(
          {required String classroomId,
          required String classroomSectionStudentsId}) =>
      showAddPointFunction(
          isParent: widget.isParent,
          context: context,
          childName: "",
          token: _token,
          classroomId: classroomId,
          classroomSectionStudentsId: classroomSectionStudentsId,
          studentId: widget.studentId);

  void _navigateToNotificationScreen() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
      (route) => false);

  void _onGetTeacherStudentProfileInSchoolHouseFailState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);
}
