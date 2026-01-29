import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/colors.dart';

class HourlyWeatherGraph extends StatelessWidget {
  final List<double> hourlyForecast;
  const HourlyWeatherGraph({super.key, required this.hourlyForecast});
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final hour = value.toInt();

    if (hour % 3 != 0) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        '$hour:00',
        style: const TextStyle(fontSize: 12, color: AppColors.smallText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 23,
          minY: 0,
          maxY: 40,

          gridData: FlGridData(show: false),

          borderData: FlBorderData(show: false),

          titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 3,
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
          ),

          lineBarsData: [
            LineChartBarData(
              spots: _createSpots(),
              isCurved: true,
              color: AppColors.largeText,
              barWidth: 3,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> _createSpots() {
    return hourlyForecast
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value))
        .toList();
  }
}
