import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:th_knn/widgets/text_style.dart';
import 'package:th_knn/values/colors.dart';
import 'package:th_knn/values/strings.dart';

class _BarChartWidget extends StatelessWidget {
  final Map data;
  final List<Color> colors;
  const _BarChartWidget(this.data, this.colors);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        borderData: borderData,
        titlesData: titlesData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 7,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: customBoxColorOrig,
          tooltipPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
          axisNameSize: 30,
          axisNameWidget: Text(result, style: customTextStyle(size: 18.0))),
      leftTitles: AxisTitles(
        axisNameSize: 20,
        axisNameWidget: Text(occurence,
            textAlign: TextAlign.center, style: customTextStyle()),
        sideTitles: const SideTitles(showTitles: true, reservedSize: 30),
      ),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)));

  FlBorderData get borderData => FlBorderData(
        border: const Border(left: BorderSide(), bottom: BorderSide()),
        show: true,
      );

  List<BarChartGroupData> get barGroups => data.entries.map((entry) {
        return BarChartGroupData(
          x: data.keys.toList().indexOf(entry.key),
          barRods: [
            BarChartRodData(
              toY: entry.value.toDouble(),
              width: 30,
              borderRadius: BorderRadius.zero,
              color: colors[data.keys.toList().indexOf(entry.key)],
            ),
          ],
        );
      }).toList();
}

class BarChartWidget extends StatefulWidget {
  final Map data;
  final List<Color> colors;
  const BarChartWidget({super.key, required this.data, required this.colors});

  @override
  State<StatefulWidget> createState() => BarChartWidgetState();
}

class BarChartWidgetState extends State<BarChartWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: _BarChartWidget(widget.data, widget.colors),
    );
  }
}
