import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';
import 'package:schools/presentation/screens/school_houses/widgets/chart_content_widget.dart';
import 'package:schools/presentation/screens/side_menu_widget/widgets/curve.dart';

class SchoolHousesChartWidget extends StatelessWidget {
  final SchoolHousesBloc? schoolHousesBloc;

  const SchoolHousesChartWidget({Key? key, required this.schoolHousesBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildScreenContent();
  }

  Stack buildScreenContent() {
    return Stack(
    children: [
      ClipPath(
          clipper: GeneralCurve(),
          child: Container(
            height: 200,
            color: ColorsManager.whiteColor,
          )),
      ChartContentWidget(schoolHousesBloc: schoolHousesBloc!),
      Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 72),
          child: SizedBox(
              height: 150,
              width: 150,
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: ColorsManager.blackColor, width: 1),
                    color: ColorsManager.whiteColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100))),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(ImagesPath.cup),
                ),
              )),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 60, bottom: 45),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _iconData(Icons.confirmation_num_sharp),
              _iconData(Icons.confirmation_num_sharp),
              _iconData(Icons.confirmation_num_sharp),
              _iconData(Icons.confirmation_num_sharp),
            ],
          ),
        ),
      )
    ],
  );
  }

  Widget _iconData(IconData icon) => Icon(
        icon,
        color: Colors.yellow,
        size: 30,
      );
}
