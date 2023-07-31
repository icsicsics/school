import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/base/widget/base_stateful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/class_houses/get_class_houses_response.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/data/source/remote/model/student_houses/search_item.dart';
import 'package:schools/data/source/remote/model/weather/main.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/widgets/regular_text_widget.dart';
import 'package:schools/presentation/widgets/semi_bold_text_widget.dart';
import 'package:schools/presentation/screens/my_children/my_children_screen.dart';
import 'package:schools/presentation/screens/notifications/notifications_screen.dart';
import 'package:schools/presentation/screens/school_houses/widgets/is_not_coming_from_home/is_not_coming_from_home_content_widget.dart';
import 'package:schools/presentation/screens/school_houses/widgets/open_sort_bottom_sheet.dart';
import 'package:schools/presentation/screens/school_houses/widgets/school_houses_chart_widget.dart';
import 'package:schools/presentation/screens/school_houses/widgets/school_houses_content_widget.dart';
import 'package:schools/presentation/screens/student_houses/student_houses_screen.dart';

class SchoolHousesScreen extends BaseStatefulWidget {
  final String classRoomId;
  final bool isComingFromHome;
  final String branchId;
  final String teacherId;
  final String classroomToSectionId;

  const SchoolHousesScreen({
    super.key,
    required this.classRoomId,
    required this.isComingFromHome,
    required this.branchId,
    required this.teacherId,
    required this.classroomToSectionId,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SchoolHousesScreenState();
}

class _SchoolHousesScreenState extends BaseState<SchoolHousesScreen> {
  SearchItem _selectedValue = SearchItem(id: -1, name: "");

  SchoolHousesBloc get _schoolHousesBloc =>
      BlocProvider.of<SchoolHousesBloc>(context);
  GetClassHousesResponse getClassHousesResponse = GetClassHousesResponse();
  GetStudentHousesResponse getStudentHousesResponse =
      GetStudentHousesResponse();
  bool isFather = false;
  String token = "";
  String language = "";

  @override
  void initState() {
    print(widget.branchId);
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    isFather = await SharedPreferencesManager.getIsFather() ?? false;
    token = await SharedPreferencesManager.getTokenDio() ?? "";
    language = await SharedPreferencesManager.getLanguageCodeHelper() ?? "";
    if (widget.isComingFromHome != true) {
      _schoolHousesBloc.add(GetStudentHousesEvent(
          classroomToSectionId: widget.classRoomId, token: token));
    }
    _schoolHousesBloc.add(GetSchoolHousesEvent(
      token: token,
      classRoomId: widget.classRoomId,
      isComingFromHome: widget.isComingFromHome,
      search: _selectedValue.id,
    ));
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocConsumer<SchoolHousesBloc, SchoolHousesState>(
        listener: (context, state) {
          if (state is GetSchoolHousesLoadingState) {
            showLoading();
          } else if (state is GetSchoolHousesSuccessState) {
            getClassHousesResponse = state.response;
            hideLoading();
          } else if (state is GetSchoolHousesFillState) {
            _onGetSchoolHousesFillState(state.error);
          } else if (state is NavigateToNotificationScreenState) {
            _navigateToNotificationScreen(state.isNotificationSelected);
          } else if (state is NavigateToStudentHousesScreenState) {
            _navigateToStudentHousesScreen(state.data.classroomToSectionId!);
          } else if (state is NavigateToMyChildrenScreenState) {
            _navigateToMyChildrenScreen(
              state.studentId,
              state.classroomToSectionId,
              widget.branchId,
            );
          } else if (state is GetStudentHousesSuccessState) {
            getStudentHousesResponse = state.response;
            hideLoading();
          } else if (state is GetStudentHousesFillState) {
            _onGetStudentHousesFillState(state.error);
          } else if (state is GetSearchValuesSuccessState) {
            hideLoading();
            openValuesBottomSheet(
                context: context,
                values: state.values,
                height: 250,
                selectedValue: _selectedValue,
                selectValueEvent: (value) {
                  setState(() {
                    _selectedValue = value;
                    _schoolHousesBloc.add(GetSchoolHousesEvent(
                      token: token,
                      classRoomId: widget.classRoomId,
                      isComingFromHome: widget.isComingFromHome,
                      search: _selectedValue.id,
                    ));
                  });
                });
          } else if (state is GetSearchValuesFailState) {}
        },
        builder: (context, state) {
          if (state is GetSchoolHousesLoadingState) {
            return Container();
          }

          return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          ColorsManager.primaryColor,
                          ColorsManager.secondaryColor,
                        ],
                        stops: [0.5, 0.8],
                      )),
                      height: 500,
                      child: SchoolHousesChartWidget(
                          schoolHousesBloc: _schoolHousesBloc)),
                  widget.isComingFromHome
                      ? SchoolHousesContentWidget(
                          schoolHousesBloc: _schoolHousesBloc,
                          getClassHousesResponse: getClassHousesResponse,
                          language: language,
                          token: token,
                        )
                      : isFather
                          ? SizedBox.shrink()
                          : IsNotComingFromHomeContentWidget(
                              schoolHousesBloc: _schoolHousesBloc,
                              token: token,
                              getStudentHousesResponse:
                                  getStudentHousesResponse)
                ],
              ));
          return getClassHousesResponse.data?.isNotEmpty ?? false
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                            colors: [
                              ColorsManager.primaryColor,
                              ColorsManager.secondaryColor,
                            ],
                            stops: [0.5, 0.8],
                          )),
                          height: 500,
                          child: SchoolHousesChartWidget(
                              schoolHousesBloc: _schoolHousesBloc)),
                      widget.isComingFromHome
                          ? SchoolHousesContentWidget(
                              schoolHousesBloc: _schoolHousesBloc,
                              getClassHousesResponse: getClassHousesResponse,
                              language: language,
                              token: token,
                            )
                          : IsNotComingFromHomeContentWidget(
                              schoolHousesBloc: _schoolHousesBloc,
                              token: token,
                              getStudentHousesResponse:
                                  getStudentHousesResponse)
                    ],
                  ))
              : Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(ImagesPath.error),
                      SizedBox(
                        height: 16,
                      ),
                      BoldTextWidget(
                          text: "Ooops !", fontSize: 18, color: Colors.black),
                      SizedBox(
                        height: 12,
                      ),
                      RegularTextWidget(
                          text: "No data found",
                          fontSize: 16,
                          color: Colors.black),
                    ],
                  ),
                );
        },
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
            onTap: () {
              _schoolHousesBloc.add(GetSearchValuesEvent(
                token: token,
              ));
            },
            child: SvgPicture.asset(
              ImagesPath.filter,
              color: ColorsManager.secondaryColor,
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: () {
                  BlocProvider.of<SchoolHousesBloc>(context).add(
                      NavigateToNotificationScreenEvent(
                          isNotificationSelected: false));
                },
                child: Icon(
                  Icons.mail,
                  color: Color(0xff3bbbac),
                  size: 30,
                ),
              ),
              Visibility(
                visible: isFather,
                child: Positioned(
                  top: 8,
                  right: -5,
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<SchoolHousesBloc>(context).add(
                          NavigateToNotificationScreenEvent(
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

          // InkWell(
          //   onTap: (){
          //     BlocProvider.of<SchoolHousesBloc>(context)
          //         .add(NavigateToNotificationScreenEvent(isNotificationSelected : false));
          //   },
          //   child: Icon(Icons.mail,
          //       color: ColorsManager.secondaryColor, size: 25),
          // ),
          // Visibility(
          //   visible: isFather,
          //   child: InkWell(
          //     onTap: (){
          //       BlocProvider.of<SchoolHousesBloc>(context)
          //           .add(NavigateToNotificationScreenEvent(isNotificationSelected : true));              },
          //     child: const Icon(
          //       Icons.notifications,
          //       color: ColorsManager.yellow,
          //       size: 30,
          //     ),
          //   ),
          // ),
        ],
        title: BoldTextWidget(
            color: ColorsManager.secondaryColor,
            fontSize: 20,
            text: S.of(context).schoolHousesTitle),
      );

  void _navigateToNotificationScreen(bool isNotificationSelected) =>
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => NotificationsScreen(
                  isNotificationSelected: isNotificationSelected,
                )),
      );

  void _onGetSchoolHousesFillState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  void _navigateToStudentHousesScreen(String s) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => StudentHousesScreen(
              token: token, classroomToSectionId: s, language: language)));

  void _navigateToMyChildrenScreen(studentId, classroomToSectionId, branchId) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => MyChildrenScreen(
                    studentId: studentId,
                    language: language,
                    classroomId: getStudentHousesResponse.data!.classroomId!,
                    classroomSectionStudentsId: classroomToSectionId.toString(),
                    isParent: false,
                    branchId: branchId,
                classroomToSectionId: widget.classroomToSectionId,
                teacherId: widget.teacherId,
                  )));

  void _onGetStudentHousesFillState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);
}
