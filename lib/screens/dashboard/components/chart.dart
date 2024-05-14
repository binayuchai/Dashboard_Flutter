import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
// import 'package:fl_chart/fl_chart.dart';

class ChartGraph extends StatelessWidget {
   ChartGraph({
    Key? key,
  }) :super(key: key);

  final Map<String,double> dataMap = {
    "XD File":5,
    "Figma File":3,
    "Sales PDF":4,
    "Excel File":6,
  };

  static final colorList = <Color>[
    Colors.greenAccent,
  ];



  @override
  Widget build(BuildContext context) {

    double totalValue = dataMap.values.reduce((value,element)=> value + element);
    return Container(


      child: PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.shortestSide / 2,
        // colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        baseChartColor: Colors.grey[300]!,


        legendOptions: const LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.bottom,
          showLegends: true,
          // legendShape: _BoxShape.circle,
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValuesInPercentage: true,
          showChartValues: true,
          showChartValuesOutside: false,
        ),
        totalValue: totalValue,



      ),

    );
  }
}
