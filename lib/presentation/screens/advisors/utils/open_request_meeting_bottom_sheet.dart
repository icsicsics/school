import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/advisors/response/guide.dart';
import 'package:schools/presentation/screens/advisors/widgets/request_meeting_bottom_sheet_widget.dart';
import 'package:schools/presentation/screens/school_houses/widgets/show_bottom_sheet_widget.dart';

Future openRequestMeetingBottomSheet({
  required BuildContext context,
  required double height,
  required List<Guide> guides,
  required String studentId,
  required String teacherId,
  required String classroomToSectionId,
}) async {
  await showModalBottomSheet(
      isDismissible: false,
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: RequestMeetingBottomSheetWidget(
              height: height,
              guides: guides,
              studentId: studentId,
              teacherId: teacherId,
              classroomToSectionId: classroomToSectionId,
            ),
          ));
}
