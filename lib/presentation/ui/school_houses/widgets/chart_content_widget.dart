import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartContentWidget extends StatefulWidget {
  const ChartContentWidget({Key? key}) : super(key: key);

  @override
  State<ChartContentWidget> createState() => _ChartContentWidgetState();
}

class _ChartContentWidgetState extends State<ChartContentWidget> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {


    return  Padding(
        padding: const EdgeInsets.all(50),
        //Initialize the spark charts widget
        child: SfSparkBarChart(
          axisLineDashArray: [1.1,5,4,4,4],
          data: const [12,1,1,1,4],
          trackball: const  SparkChartTrackball(
            borderRadius: BorderRadius.all(Radius.circular(45)),
            borderColor: Colors.blueAccent,
            width: 15,
            borderWidth: 20,
              activationMode: SparkChartActivationMode.tap),
          color: Colors.white,
          axisLineWidth: 1,
          axisLineColor: Colors.black,
          borderWidth: 5,
          isInversed: false,
          axisCrossesAt: 20.0,
          borderColor: Colors.transparent,
        ),
    );

}

}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}