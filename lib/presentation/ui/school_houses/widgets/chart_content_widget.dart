import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartContentWidget extends StatefulWidget {
  const ChartContentWidget({Key? key}) : super(key: key);

  @override
  State<ChartContentWidget> createState() => _ChartContentWidgetState();
}

class _ChartContentWidgetState extends State<ChartContentWidget> {
  List<SalesData> columnData = [
    SalesData(x: "hello 1", y: 170),
    SalesData(x: "hello 2", y: 170),
    SalesData(x: "hello 3", y: 170),
    SalesData(x: "hello 4", y: 170),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
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
          majorGridLines: const MajorGridLines(color: Colors.transparent),
          axisLine: const AxisLine(color: Colors.white),
          minorGridLines: const MinorGridLines(color: Colors.transparent),
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
            dataLabelSettings: const DataLabelSettings(color: Colors.white),
            isVisibleInLegend: false,
            spacing: 1.5),
      ],
      margin: const EdgeInsets.only(top: 80, left: 50, right: 50),
    );
  }
}

class SalesData {
  SalesData({required this.x, required this.y});

  final String x;
  final double y;
}
