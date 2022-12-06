import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartContentWidget extends StatefulWidget {
  const ChartContentWidget({Key? key}) : super(key: key);

  @override
  State<ChartContentWidget> createState() => _ChartContentWidgetState();
}

class _ChartContentWidgetState extends State<ChartContentWidget> {


    List<SalesData> columnData=[
      SalesData(x: "hello 1",y: 1.0),
      SalesData(x: "hello 2",y: 1.0),
      SalesData(x: "hello 3",y: 1.0),
      SalesData(x: "hello 4",y: 1.0),
    ];


  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(50),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            borderColor: Colors.white,
            borderWidth: 0,
            isVisible: true,
              majorGridLines:const MajorGridLines(color: Colors.transparent),
            axisLine:const  AxisLine(color: Colors.white),

          ),
          primaryYAxis: NumericAxis(
            isVisible: true,
            majorGridLines:const MajorGridLines(color: Colors.transparent),
            axisLine:const  AxisLine(color: Colors.white),
            minorGridLines:const MinorGridLines(color: Colors.transparent) ,
            borderColor: Colors.transparent,
            borderWidth: 0,
            placeLabelsNearAxisLine: false
          ),
          borderColor: Colors.transparent,
          borderWidth: 0,
          legend: Legend(isVisible: false),

          plotAreaBorderColor: Colors.transparent,
          series: <ChartSeries> [
            ColumnSeries<SalesData, String>(
              dataSource: columnData,
              xValueMapper: (SalesData salesData,_)=>salesData.x,
              yValueMapper: (SalesData salesData,_)=>salesData.y,
            )
          ],

        )
    );

}

}

class SalesData {
  SalesData({required this.x,required  this.y});
  final String x;
  final double y;
}
