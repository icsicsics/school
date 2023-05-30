import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/data/source/remote/model/weather/weather_response.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/screens/home/widgets/father/home_father_content_widget.dart';
import 'package:schools/presentation/screens/home/widgets/father/test.dart';
import 'package:schools/presentation/screens/home/widgets/home_app_bar_widget.dart';
import 'package:schools/presentation/screens/home/widgets/teacher/home_teacher_details_widget.dart';
import 'package:schools/presentation/screens/home/widgets/title_widget.dart';
import 'package:schools/presentation/screens/notifications/notifications_screen.dart';

class HomeContentWidget extends StatefulWidget {
  final String token;
  final GlobalKey<ScaffoldState> globalKey;
  final bool isFather;
  final HomeBloc bloc;
  final String language;
  final GetTeacherHomeResponse teacherHomeResponse;
  final GetChildrenByParentResponse parentHomeResponse;
  final WeatherResponse weatherResponse;
  final TeacherStudentProfileInSchoolHouseResponse
      teacherStudentProfileInSchoolHouseResponse;

  const HomeContentWidget(
      {Key? key,
      required this.globalKey,
      required this.isFather,
      required this.bloc,
      required this.language,
      required this.parentHomeResponse,
      required this.teacherHomeResponse,
      required this.token,
      required this.teacherStudentProfileInSchoolHouseResponse,
      required this.weatherResponse})
      : super(key: key);

  @override
  State<HomeContentWidget> createState() => _HomeContentWidgetState();
}

class _HomeContentWidgetState extends State<HomeContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBarWidget(
            onTapMenu: () => widget.globalKey.currentState!.openDrawer(),
            onTapNotifications: (bool isNotificationSelected) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => NotificationsScreen(
                            isNotificationSelected: isNotificationSelected,
                          )));
            },
            isFather: widget.isFather,
            bloc: widget.bloc,
            language: widget.language,
            teacherHomeResponse: widget.teacherHomeResponse),
        const SizedBox(height: 2),
        HomeTitleWidget(
          weatherResponse: widget.weatherResponse,
          token: widget.token,
          language: widget.language,
          bloc : widget.bloc,

        ),
        Expanded(child: _buildScreen())
      ],
    );
  }

  Widget _buildScreen() {
    if (widget.isFather == true) {
      return widget.parentHomeResponse.data != null
          ?
      // HomeFatherContentWidget(
      //         parentHomeResponse: widget.parentHomeResponse,
      //         homeBloc: widget.bloc,
      //         token: widget.token,
      //         teacherStudentProfileInSchoolHouseResponse:
      //             widget.teacherStudentProfileInSchoolHouseResponse,
      //         language: widget.language)
      Test(
          parentHomeResponse: widget.parentHomeResponse,
          homeBloc: widget.bloc,
          token: widget.token,
          teacherStudentProfileInSchoolHouseResponse:
          widget.teacherStudentProfileInSchoolHouseResponse,
          language: widget.language)

          : Container();
    }
    return SingleChildScrollView(
      child: HomeTeacherDetailsWidget(
          homeBloc: widget.bloc,
          teacherHomeResponse: widget.teacherHomeResponse,
          token: widget.token,
          language: widget.language),
    );
  }
}
