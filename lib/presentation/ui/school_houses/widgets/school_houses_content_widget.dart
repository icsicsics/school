import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/class_houses/get_class_houses_response.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';
import 'package:schools/presentation/ui/school_houses/widgets/school_houses_card_item_widget.dart';
import 'package:schools/presentation/ui/school_houses/widgets/school_houses_chart_widget.dart';

class SchoolHousesContentWidget extends StatefulWidget {
  final SchoolHousesBloc schoolHousesBloc;
  final GetClassHousesResponse getClassHousesResponse;

  const SchoolHousesContentWidget({Key? key, required this.schoolHousesBloc,required this.getClassHousesResponse})
      : super(key: key);

  @override
  State<SchoolHousesContentWidget> createState() =>
      _SchoolHousesContentWidgetState();
}

class _SchoolHousesContentWidgetState extends State<SchoolHousesContentWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          widget.getClassHousesResponse.data != null
              ? GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 220),
                  itemCount: widget.getClassHousesResponse.data!.length,
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 80, left: 5, right: 5),
                  shrinkWrap: true,
                  semanticChildCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return SchoolHousesCardItemWidget(
                      icon: const Icon(Icons.account_circle),
                      teachersValue: widget
                          .getClassHousesResponse
                          .data![index]
                          .numberTeachersHouse!
                          .toString(),
                      pointsValue: widget
                          .getClassHousesResponse.data![index].totalPointsHouse
                          .toString(),
                      icon2: Image.asset(ImagesPath.cup, height: 30, width: 30),
                      label: widget.getClassHousesResponse
                          .data![index].houseName!,
                      studentsValue: widget
                          .getClassHousesResponse
                          .data![index]
                          .numberStudentsHouse!
                          .toString(),
                      hasIcon2: true,
                      onTap: () => widget.schoolHousesBloc.add(
                          NavigateToAddPointsScreenEvent(
                              data: widget
                                  .getClassHousesResponse.data![index])),
                    );
                  })
              : Container()
        ],

    );
  }
}
