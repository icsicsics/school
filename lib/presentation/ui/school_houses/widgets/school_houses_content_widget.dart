import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/school_houses/widgets/school_houses_card_item_widget.dart';
import 'package:schools/presentation/ui/school_houses/widgets/school_houses_chart_widget.dart';

class SchoolHousesContentWidget extends StatefulWidget {
  const SchoolHousesContentWidget({Key? key}) : super(key: key);

  @override
  State<SchoolHousesContentWidget> createState() =>
      _SchoolHousesContentWidgetState();
}

class _SchoolHousesContentWidgetState extends State<SchoolHousesContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SchoolHousesChartWidget(),
          Row(
            children: const [
              Expanded(
                  child: SchoolHousesCardItemWidget(
                icon: Icon(Icons.account_circle),
                teachersValue: '6',
                pointsValue: '172',
                icon2: Icon(Icons.ac_unit),
                label: 'Appreciative',
                studentsValue: '20',
                hasIcon2: true,
              )),
              Expanded(
                  child: SchoolHousesCardItemWidget(
                icon: Icon(Icons.account_circle),
                teachersValue: '1',
                pointsValue: '172',
                icon2: Icon(Icons.ac_unit),
                label: 'Interactive',
                studentsValue: '20',
              )),
            ],
          ),
          // Row(
          //   children: const [
          //     Expanded(
          //         child: SchoolHousesCardItemWidget(
          //       icon: Icon(Icons.account_circle),
          //       teachersValue: '6',
          //       pointsValue: '172',
          //       icon2: Icon(Icons.ac_unit),
          //       label: 'Appreciative',
          //       studentsValue: '20',
          //     )),
          //     Expanded(
          //         child: SchoolHousesCardItemWidget(
          //       icon: Icon(Icons.account_circle),
          //       teachersValue: '1',
          //       pointsValue: '172',
          //       icon2: Icon(Icons.ac_unit),
          //       label: 'Interactive',
          //       studentsValue: '20',
          //     )),
          //   ],
          // ),
        ],
      ),
    );
  }
}
