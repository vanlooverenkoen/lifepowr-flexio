import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flexio_kvl/model/history/history_consumption.dart';
import 'package:flexio_kvl/viewmodel/history/charts/peak_consumption_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
class FlChartPeakConsumptionViewModel extends PeakConsumptionViewModel {
  LineChartData? _lineChartData;

  LineChartData get lineChartData => _lineChartData!;

  FlChartPeakConsumptionViewModel(super.historyRepository);

  @override
  Future<void> processData(HistoryConsumption data) async {
    final something = <FlSpot>[];
    final consumptionLineChartData = <FlSpot>[];
    final yearlyLineChartData = <FlSpot>[];
    final monthlyLineChartData = <FlSpot>[];
    var minX = 0.0;
    var minY = 0.0;
    var maxX = 0.0;
    var maxY = 0.0;
    var index = 0.0;
    final items = data.data;
    for (final item in items) {
      index++;
      minX = min(minX, item.startDate.millisecondsSinceEpoch.toDouble());
      maxY = max(maxY, item.startDate.millisecondsSinceEpoch.toDouble());
      minY = min(min(minY, item.consumption), min(item.monthlyPeakConsumption, item.yearlyPeakConsumption));
      maxX = max(max(maxX, item.consumption), max(item.monthlyPeakConsumption, item.yearlyPeakConsumption));
      something.add(FlSpot(item.startDate.millisecondsSinceEpoch.toDouble(), index));
      consumptionLineChartData.add(FlSpot(item.startDate.millisecondsSinceEpoch.toDouble(), item.consumption));
      monthlyLineChartData.add(FlSpot(item.startDate.millisecondsSinceEpoch.toDouble(), item.monthlyPeakConsumption));
      yearlyLineChartData.add(FlSpot(item.startDate.millisecondsSinceEpoch.toDouble(), item.yearlyPeakConsumption));
    }
    final dateFormat = DateFormat('dd/MM');
    _lineChartData = LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            var hasDrawnDate = false;
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              final sb = StringBuffer();
              if (!hasDrawnDate) {
                final date = DateTime.fromMillisecondsSinceEpoch(flSpot.x.toInt());
                sb.writeln(dateFormat.format(date));
                hasDrawnDate = true;
              }
              sb.write(flSpot.y.toStringAsFixed(2));
              return LineTooltipItem(
                sb.toString(),
                TextStyle(color: barSpot.bar.color ?? Colors.grey),
              );
            }).toList();
          },
        ),
      ),
      gridData: FlGridData(
        drawHorizontalLine: true,
        drawVerticalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(axisNameWidget: const SizedBox()),
        topTitles: AxisTitles(axisNameWidget: const SizedBox()),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) => Text(
              dateFormat.format(DateTime.fromMillisecondsSinceEpoch(value.toInt())),
              style: const TextStyle(color: Colors.black, fontSize: 10),
            ),
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: monthlyLineChartData,
          isCurved: true,
          curveSmoothness: 0,
          color: Colors.grey,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        LineChartBarData(
          spots: yearlyLineChartData,
          isCurved: true,
          curveSmoothness: 0,
          color: Colors.purple,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
        LineChartBarData(
          spots: consumptionLineChartData,
          isCurved: true,
          curveSmoothness: 0,
          color: Colors.red,
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }
}
