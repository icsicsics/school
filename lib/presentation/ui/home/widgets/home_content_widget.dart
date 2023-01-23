import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/ui/home/widgets/father/home_father_content_widget.dart';
import 'package:schools/presentation/ui/home/widgets/home_app_bar_widget.dart';
import 'package:schools/presentation/ui/home/widgets/teacher/home_teacher_details_widget.dart';
import 'package:schools/presentation/ui/home/widgets/title_widget.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';

class HomeContentWidget extends StatefulWidget {
  final String token;
  final GlobalKey<ScaffoldState> globalKey;
  final bool isFather;
  final HomeBloc bloc;
  final String language;
  final GetTeacherHomeResponse teacherHomeResponse;
  final GetChildrenByParentResponse parentHomeResponse;

  const HomeContentWidget(
      {Key? key,
      required this.globalKey,
      required this.isFather,
      required this.bloc,
      required this.language,
      required this.parentHomeResponse,
      required this.teacherHomeResponse,
      required this.token})
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
            onTapNotifications: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const NotificationsScreen()),
                  (route) => false);
            },
            isFather: widget.isFather,
            bloc: widget.bloc,
            language: widget.language,
            teacherHomeResponse: widget.teacherHomeResponse),
        const SizedBox(height: 2),
        const HomeTitleWidget(),
        Expanded(child: SingleChildScrollView(child: _buildScreen()))
      ],
    );
  }

  Widget _buildScreen() {
    if (widget.isFather == true) {
      return HomeFatherContentWidget(
          parentHomeResponse: widget.parentHomeResponse);
    }
    return HomeTeacherDetailsWidget(
        teacherHomeResponse: widget.teacherHomeResponse, token: widget.token);
  }
}
