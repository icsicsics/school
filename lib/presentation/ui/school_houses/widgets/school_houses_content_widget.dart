import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/school_houses/widgets/school_houses_chart_widget.dart';

class SchoolHousesContentWidget extends StatefulWidget {
  const SchoolHousesContentWidget({Key? key}) : super(key: key);

  @override
  State<SchoolHousesContentWidget> createState() => _SchoolHousesContentWidgetState();
}

class _SchoolHousesContentWidgetState extends State<SchoolHousesContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SchoolHousesChartWidget()
      ],
    );
  }
}
