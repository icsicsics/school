import 'package:flutter/material.dart';
import 'package:schools/presentation/screens/advisors/widgets/advisor_body_widget.dart';
import 'package:schools/presentation/screens/advisors/widgets/advisor_header_widget.dart';

class AdvisorWidget extends StatelessWidget {
  const AdvisorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdvisorHeaderWidget(),
        const SizedBox(height: 16),
        ListView.builder(
            itemCount: 3,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AdvisorBodyWidget();
            }),
      ],
    );
  }
}
