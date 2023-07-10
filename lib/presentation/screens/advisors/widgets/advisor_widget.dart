import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/advisor.dart';
import 'package:schools/presentation/screens/advisors/widgets/advisor_body_widget.dart';
import 'package:schools/presentation/screens/advisors/widgets/advisor_header_widget.dart';

class AdvisorWidget extends StatelessWidget {
  final String studentName;
  final String studentImage;
  final List<Advisor> advisors;

  const AdvisorWidget({
    Key? key,
    required this.studentName,
    required this.studentImage,
    required this.advisors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdvisorHeaderWidget(
          studentName: studentName,
          studentImage: studentImage,
        ),
        const SizedBox(height: 16),
        ListView.builder(
            itemCount: advisors.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AdvisorBodyWidget(advisor: advisors[index]);
            }),
      ],
    );
  }
}
