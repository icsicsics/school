import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/screens/my_children/my_children_screen.dart';
import 'package:schools/presentation/screens/profile/widgets/child_item_widget.dart';

class TeacherOfWidget extends StatelessWidget {
  final TeacherInfoResponse teacherInfoResponse;
  final String language;
  final String classroomId;
  final String classroomSectionStudentsId;

  const TeacherOfWidget(
      {Key? key,
      required this.teacherInfoResponse,
      required this.language,
      required this.classroomId,
      required this.classroomSectionStudentsId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: teacherInfoResponse.data != null
          ? Container(
              decoration: BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 3, bottom: 3, right: 8, left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldTextWidget(
                          text: "Educator of",
                          fontSize: 16,
                          color: ColorsManager.secondaryColor),
                      SizedBox(
                        height: 105,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(5),
                            itemCount:
                            teacherInfoResponse.data!.classroomsTeacher!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                  onTap: () {

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: ChildItemWidget(
                                      isStartVisible: false,
                                      imageUrl:teacherInfoResponse.data!
                                          .classroomsTeacher![index].getLogo?.mediaUrl ??
                                          "",
                                      childName: teacherInfoResponse.data!
                                              .classroomsTeacher![index].classroomName ??
                                          "",
                                    ),
                                  ));
                            }),
                      ),
                    ],
                  )),
            )
          : Container(),
    );
  }
}
