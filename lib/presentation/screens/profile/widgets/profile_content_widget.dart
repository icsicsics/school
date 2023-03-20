import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';
import 'package:schools/presentation/screens/profile/widgets/father_of_widget.dart';
import 'package:schools/presentation/screens/profile/widgets/profile_header_widget.dart';
import 'package:schools/presentation/screens/profile/widgets/profile_info_content_widget.dart';
import 'package:schools/presentation/screens/profile/widgets/teacher_of_widget.dart';

class ProfileContentWidget extends StatefulWidget {
  final bool isFather;
  final String profileImage;
  final ProfileBloc bloc;
  final TeacherInfoResponse teacherInfoResponse;
  final FatherInfoResponse fatherInfoResponse;
  final String language;
  final String classroomId;
  final String classroomSectionStudentsId;

  const ProfileContentWidget(
      {Key? key,
      required this.isFather,
      required this.profileImage,
      required this.bloc,
      required this.teacherInfoResponse,
      required this.fatherInfoResponse,
      required this.language,
      required this.classroomSectionStudentsId,
      required this.classroomId})
      : super(key: key);

  @override
  State<ProfileContentWidget> createState() => _ProfileContentWidgetState();
}

class _ProfileContentWidgetState extends State<ProfileContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ProfileHeaderWidget(
              bloc: widget.bloc,
              profileImage: widget.profileImage,
              isFather: widget.isFather,
              fatherInfoResponse: widget.fatherInfoResponse,
              teacherInfoResponse: widget.teacherInfoResponse),
          ProfileInfoContentWidget(
              isFather: widget.isFather,
              fatherInfoResponse: widget.fatherInfoResponse,
              teacherInfoResponse: widget.teacherInfoResponse),
           SizedBox(height: MediaQuery.of(context).size.height/12),
          widget.isFather
              ? FatherOfWidget(
                  fatherInfoResponse: widget.fatherInfoResponse,
                  language: widget.language,
                  classroomId: widget.classroomId,
                  classroomSectionStudentsId: widget.classroomSectionStudentsId,
                )
              :   TeacherOfWidget(
            teacherInfoResponse: widget.teacherInfoResponse,
            language: widget.language,
            classroomId: widget.classroomId,
            classroomSectionStudentsId: widget.classroomSectionStudentsId,
          )
        ],
      ),
    );
  }
}
