import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget({super.key});

  final List<String> weekdayLabels = [
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
    'Min'
  ];

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    interval: 1,
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(weekdayLabels[value.toInt()]);
                    })),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 100,
          gridData: const FlGridData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 30),
                FlSpot(1, 45),
                FlSpot(2, 60),
                FlSpot(3, 49),
                FlSpot(4, 22),
                FlSpot(5, 80),
                FlSpot(6, 32),
              ],
              isCurved: true,
              color: const Color(0xFF08A6FF),
              barWidth: 5,
              // dotData: FlDotData(show: false),
              belowBarData:
                  BarAreaData(show: true, color: const Color(0x6608A6FF)),
            ),
          ],
        ),
      );
}
