import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/class_houses/get_class_houses_response.dart';
import 'package:schools/presentation/ui/school_houses/widgets/school_houses_card_item_widget.dart';
import 'package:schools/presentation/ui/school_houses/widgets/school_houses_chart_widget.dart';

class SchoolHousesContentWidget extends StatefulWidget {
  final GetClassHousesResponse getClassHousesResponse;
  const SchoolHousesContentWidget({Key? key,required this.getClassHousesResponse}) : super(key: key);

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
          Container(
            color: ColorsManager.backgroundColor,
            child: Row(
              children: [
                Expanded(
                    child: SchoolHousesCardItemWidget(
                        icon: const Icon(Icons.account_circle),
                        teachersValue: widget.getClassHousesResponse.data![0]
                            .numberTeachersHouse!
                            .toString(),
                        pointsValue: widget
                            .getClassHousesResponse.data![0].totalPointsHouse
                            .toString(),
                        icon2:
                            Image.asset(ImagesPath.cup, height: 30, width: 30),
                        label:
                            widget.getClassHousesResponse.data![0].houseName!,
                        studentsValue: widget.getClassHousesResponse.data![0]
                            .numberStudentsHouse!
                            .toString(),
                        hasIcon2: true, index: 0)),
                Expanded(child: Container())
                // Expanded(
                //     child: SchoolHousesCardItemWidget(
                //         icon: const Icon(Icons.account_circle),
                //         teachersValue: '1',
                //         pointsValue: '172',
                //         icon2: Image.asset(ImagesPath.cup,height: 30,width: 30,color: Colors.white,),
                //         label: S.of(context).interactive,
                //         studentsValue: '20',
                //         hasIcon2: true,)),
              ],
            ),
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
