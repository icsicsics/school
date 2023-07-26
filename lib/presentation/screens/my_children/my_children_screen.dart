import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/base/widget/base_stateful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/advisors/response/guide.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/get_teacher_principl_by_classroom_Id_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';
import 'package:schools/presentation/screens/advisors/advisors_screen.dart';
import 'package:schools/presentation/screens/advisors/utils/open_request_meeting_bottom_sheet.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/screens/my_children/widget/my_children_content_widget.dart';
import 'package:schools/presentation/screens/notifications/notifications_screen.dart';

class MyChildrenScreen extends BaseStatefulWidget {
  final String studentId;
  final String language;
  final String classroomId;
  final String classroomSectionStudentsId;
  final bool isParent;
  final String? branchId;
  final String? classroomToSectionId;
  final String? teacherId;

  const MyChildrenScreen({
    super.key,
    required this.studentId,
    required this.language,
    required this.classroomId,
    required this.classroomSectionStudentsId,
    required this.isParent,
    this.branchId = "",
    this.classroomToSectionId = "",
    this.teacherId = "",
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _MyChildrenScreenState();
}

class _MyChildrenScreenState extends BaseState<MyChildrenScreen> {
  TeacherStudentProfileInSchoolHouseResponse
      _teacherStudentProfileInSchoolHouseResponse =
      TeacherStudentProfileInSchoolHouseResponse();
  GetTeacherPrinciplByClassroomIdResponse
      _getTeacherPrinciplByClassroomIdResponse =
      GetTeacherPrinciplByClassroomIdResponse();

  MyChildrenBloc get _bloc => BlocProvider.of<MyChildrenBloc>(context);
  bool _isFather = false;
  String _token = '';
  List<String> _guidesId = [];
  List<Guide> _guides = [];

  @override
  void initState() {
    _bloc.add(GetIsFatherEvent());
    if ((widget.branchId ?? "").isNotEmpty)
      _bloc.add(GetGuidesEvent(branchId: widget.branchId ?? ""));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<MyChildrenBloc, MyChildrenState>(
      listener: (context, state) {
        if (state is OpenAddPointAlertState) {
          _openAddPointAlert(
              classroomId: widget.classroomId,
              classroomSectionStudentsId:
                  widget.classroomSectionStudentsId.toString());
        } else if (state is NavigateToNotificationScreenState) {
          _navigateToNotificationScreen(state.isNotificationSelected);
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
          _bloc.add(GetPrincipleByClassroomEvent(
              token: _token, classroomId: widget.classroomId));
        } else if (state is GetTeacherStudentProfileInSchoolHouseFailState) {
          _onGetTeacherStudentProfileInSchoolHouseFailState(state.error);
        } else if (state is GetTeacherPrinciplByClassroomIdSuccessState) {
          _getTeacherPrinciplByClassroomIdResponse = state.response;
          hideLoading();
        } else if (state is GetTeacherPrinciplByClassroomIdFillState) {
          _onGetTeacherPrinciplByClassroomIdFillState(state.error);
        } else if (state is MyChildrenFilterState) {
          _teacherStudentProfileInSchoolHouseResponse.data!.points =
              state.filter;
        } else if (state is GetGuidesSuccessState) {
          _guides = state.guides;
          _guidesId= [];
          for (var item in state.guides) {
            _guidesId.add(item.guideId ?? "");
          }
        } else if (state is GetGuidesErrorState) {}
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorsManager.backgroundColor,
            floatingActionButton: _points(),
            appBar: _appBar(),
            body: _teacherStudentProfileInSchoolHouseResponse.data != null
                ? MyChildrenContentWidget(
                    teacherStudentProfileInSchoolHouseResponse:
                        _teacherStudentProfileInSchoolHouseResponse,
                    getTeacherPrinciplByClassroomIdResponse:
                        _getTeacherPrinciplByClassroomIdResponse,
                    guides: _guidesId,
                    studentId: widget.studentId,
                    teacherId: widget.teacherId ?? "",
                  )
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
          _isFather ? SizedBox.shrink() : InkWell(
            onTap: () {
              openRequestMeetingBottomSheet(
                context: context,
                height: 350,
                guides: _guides,
                studentId: _teacherStudentProfileInSchoolHouseResponse
                            .data?.studentId ?? "",
                classroomToSectionId: widget.classroomToSectionId ?? "",
                teacherId: widget.teacherId ?? "",
              );
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return AdvisorsScreen(
              //     studentName: _teacherStudentProfileInSchoolHouseResponse
              //             .data?.studentName ??
              //         "",
              //     studentImage: _teacherStudentProfileInSchoolHouseResponse
              //             .data?.getImage?.mediaUrl ??
              //         "",
              //     branchId: widget.branchId ?? "",
              //     studentId: _teacherStudentProfileInSchoolHouseResponse
              //             .data?.studentId ??
              //         "",
              //     advisors: _teacherStudentProfileInSchoolHouseResponse
              //             .data?.advisors ??
              //         [],
              //     teacherId: widget.teacherId ?? "",
              //     classroomToSectionId: widget.classroomToSectionId ?? "",
              //   );
              // }));

            },
            child: Icon(
              Icons.person,
              color: Color(0xff3bbbac),
              size: 30,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: () {
                  _bloc.add(NavigateToNotificationScreenEvent(
                      isNotificationSelected: false));
                },
                child: Icon(
                  Icons.mail,
                  color: Color(0xff3bbbac),
                  size: 30,
                ),
              ),
              Visibility(
                visible: _isFather,
                child: Positioned(
                  top: 8,
                  right: -5,
                  child: InkWell(
                    onTap: () {
                      _bloc.add(NavigateToNotificationScreenEvent(
                          isNotificationSelected: true));
                    },
                    child: const Icon(
                      Icons.notifications,
                      color: ColorsManager.yellow,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
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
          childName:
              _teacherStudentProfileInSchoolHouseResponse.data!.studentName ??
                  "",
          token: _token,
          classroomId: classroomId,
          classroomSectionStudentsId: classroomSectionStudentsId,
          studentId: widget.studentId,
          onCreatePointSuccess: () {
            _bloc.add(GetTeacherStudentProfileInSchoolHouseEvent(
                token: _token, studentId: widget.studentId));
          });

  void _navigateToNotificationScreen(bool isNotificationSelected) =>
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => NotificationsScreen(
                  isNotificationSelected: isNotificationSelected,
                )),
      );

  void _onGetTeacherStudentProfileInSchoolHouseFailState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  void _onGetTeacherPrinciplByClassroomIdFillState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);
}
