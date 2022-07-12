import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final List<double> yVals;
  final List<double> xVals;
  final String title;

  final Widget? actionWidget;
  StatsCard({
    Key? key,
    required this.yVals,
    required this.xVals,
    required this.title,
    this.actionWidget,
  }) : super(key: key) {
    assert(xVals.length == yVals.length);
  }

  @override
  Widget build(BuildContext context) {
    List<FlSpot>? points =
        List.generate(xVals.length, (i) => FlSpot(xVals[i], yVals[i]));
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 2.0, right: 18.0),
                child: actionWidget,
              )
            ],
          ),
          Container(
            height: 180,
            padding: const EdgeInsets.only(right: 20),
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: LineChart(
              LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: points,
                      isCurved: false,
                      barWidth: 2,
                      color: Colors.red,
                      dotData: FlDotData(
                        show: false,
                      ),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 10,
                  ),
                  borderData: FlBorderData(
                      border:
                          Border(bottom: BorderSide(), left: BorderSide()))),
            ),
          ),
        ],
      ),
    );
  }
}
