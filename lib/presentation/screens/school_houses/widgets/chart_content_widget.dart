import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/awesome/fa_icon.dart';
import 'package:schools/core/utils/awesome/name_icon_mapping.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartContentWidget extends StatefulWidget {
  final SchoolHousesBloc schoolHousesBloc;

  const ChartContentWidget({Key? key, required this.schoolHousesBloc})
      : super(key: key);

  @override
  State<ChartContentWidget> createState() => _ChartContentWidgetState();
}

class _ChartContentWidgetState extends State<ChartContentWidget> {
  List<SalesData> columnData = [];

  @override
  void initState() {
    super.initState();
    if (widget.schoolHousesBloc.getClassHousesResponse.data!.isNotEmpty) {
      for (var item in widget.schoolHousesBloc.getClassHousesResponse.data!) {
        columnData.add(SalesData(
            x: item.houseName ?? "", y: item.totalPointsHouse!.toDouble()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildScreenContent(columnData);
  }

  Align buildScreenContent(List<SalesData> columnData) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelStyle: TextStyle(color: Colors.transparent),
                borderColor: Colors.white,
                borderWidth: 0,
                isVisible: true,
                majorGridLines: const MajorGridLines(color: Colors.transparent),
                axisLine: const AxisLine(color: Colors.white),
              ),
              primaryYAxis: NumericAxis(
                  labelStyle: const TextStyle(color: Colors.white),
                  isVisible: true,
                  majorGridLines:
                      const MajorGridLines(color: Colors.transparent),
                  axisLine: const AxisLine(color: Colors.white),
                  minorGridLines:
                      const MinorGridLines(color: Colors.transparent),
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  placeLabelsNearAxisLine: false),
              borderColor: Colors.transparent,
              borderWidth: 0,
              legend: Legend(
                  isVisible: true,
                  alignment: ChartAlignment.center,
                  overflowMode: LegendItemOverflowMode.wrap,
                  position: LegendPosition.bottom,
                  // Templating the legend item
                  legendItemBuilder:
                      (String name, dynamic series, dynamic point, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: widget.schoolHousesBloc.getClassHousesResponse
                              .data!.isNotEmpty
                          ? widget.schoolHousesBloc.getClassHousesResponse.data!
                              .map((e) => FaIcon(getIconFromCss(
                                    e.houseIcon ?? "",
                                  )))
                              .toList()
                          : [],
                    );
                  }),
              plotAreaBorderColor: Colors.transparent,
              series: <ChartSeries>[
                ColumnSeries<SalesData, String>(
                    dataSource: columnData,
                    xValueMapper: (SalesData salesData, _) {
                      return salesData.x;
                    },
                    yValueMapper: (SalesData salesData, _) => salesData.y,
                    color: Colors.white,
                    trackColor: Colors.transparent,
                    isTrackVisible: true,
                    legendIconType: LegendIconType.image,
                    dataLabelSettings:
                        const DataLabelSettings(color: Colors.white),
                    isVisibleInLegend: true,
                    spacing: 1.5),
              ],
              margin: const EdgeInsets.only(
                  top: 60, left: 50, right: 50, bottom: 60),
            )));
  }
}

class SalesData {
  SalesData({
    required this.x,
    required this.y,
  });

  final String x;
  final double y;
}
