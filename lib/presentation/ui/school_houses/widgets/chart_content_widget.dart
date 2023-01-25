import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SalesData> columnData = [
      SalesData(
          x: "hello 1",
          y: widget.schoolHousesBloc.getClassHousesResponse.data![0]
              .totalPointsHouse!
              .toDouble()),
      SalesData(
          x: "hello 2",
          y: widget.schoolHousesBloc.getClassHousesResponse.data![1]
              .totalPointsHouse!
              .toDouble()),
      SalesData(
          x: "hello 3",
          y: widget.schoolHousesBloc.getClassHousesResponse.data![2]
              .totalPointsHouse!
              .toDouble()),
      SalesData(
          x: "hello 4",
          y: widget.schoolHousesBloc.getClassHousesResponse.data![3]
              .totalPointsHouse!
              .toDouble()),
    ];

    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                borderColor: Colors.white,
                borderWidth: 0,
                isVisible: true,
                labelStyle: const TextStyle(color: Colors.transparent),
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
              legend: Legend(isVisible: false),
              plotAreaBorderColor: Colors.transparent,
              series: <ChartSeries>[
                ColumnSeries<SalesData, String>(
                    dataSource: columnData,
                    xValueMapper: (SalesData salesData, _) => salesData.x,
                    yValueMapper: (SalesData salesData, _) => salesData.y,
                    color: Colors.white,
                    trackColor: Colors.transparent,
                    isTrackVisible: true,
                    dataLabelSettings:
                        const DataLabelSettings(color: Colors.white),
                    isVisibleInLegend: false,
                    spacing: 1.5),
              ],
              margin: const EdgeInsets.only(
                  top: 60, left: 50, right: 50, bottom: 60),
            )));
  }
}

class SalesData {
  SalesData({required this.x, required this.y});

  final String x;
  final double y;
}
