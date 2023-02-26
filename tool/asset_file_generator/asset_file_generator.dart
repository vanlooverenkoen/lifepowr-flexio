// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flexio_kvl/model/history/monthly_overview_data.dart';
import 'package:intl/intl.dart';

void main() {
  final csvHistoryFile = File('tool/asset_file_generator/history.csv');
  final assetHistoryAllFile = File('assets/data/history_all.json');
  final assetMonthlyOverviewFile = File('assets/data/monthly_overview.json');
  final lines = csvHistoryFile.readAsLinesSync();
  lines.removeAt(0);
  var index = 0;

  final months = <int, MonthlyHistoryData>{};
  final historyData = <PeakConsumptionData>[];
  final dateFormatter = DateFormat('dd-MM-yyyy HH:mm:ss');

  for (final line in lines) {
    final trimmedLine = line.trim();
    try {
      final rows = trimmedLine.split(';');
      final type = rows[10];
      if (type != 'Gevalideerd') {
        continue;
      }
      final startDate = rows[0];
      final startTime = rows[1];
      final startDateTime = dateFormatter.parse('$startDate $startTime');
      final month = startDateTime.month;
      final monthPeak = months[month];
      final endDate = rows[2];
      final endTime = rows[3];
      final endDateTime = dateFormatter.parse('$endDate $endTime');
      final registerType = rows[7];
      if (!registerType.toLowerCase().contains('afname')) continue;
      final volume = double.tryParse(rows[8].replaceAll(',', '.'));
      if (volume == null) continue;
      final data = PeakConsumptionData(
        startDate: startDateTime,
        endDate: endDateTime,
        consumption: volume,
      );
      if (monthPeak == null || monthPeak.peakConsumption < volume) {
        months[month] = MonthlyHistoryData(
          month,
          startDateTime,
          endDateTime,
          volume,
        );
      }
      historyData.add(data);
      index++;
    } catch (e) {
      print('Error: $e');
    }
  }
  final monthlyHistory = months.values.toList()..sort((e1, e2) => e1.month.compareTo(e2.month));
  final monthlyJsonString = jsonEncode(monthlyHistory);
  assetMonthlyOverviewFile.writeAsStringSync(monthlyJsonString);

  final historyJsonString = jsonEncode(historyData);
  assetHistoryAllFile.writeAsStringSync(historyJsonString);
  print('Added $index data points from the original ${lines.length} lines.');
  for (final month in months.keys) {
    final assetMonthlyFile = File('assets/data/history_month_$month.json');
    final monthlyData = historyData.where((element) => element.startDate.month == month).toList();
    final monthlyHistoryJsonString = jsonEncode(monthlyData);
    assetMonthlyFile.writeAsStringSync(monthlyHistoryJsonString);
  }
}

class PeakConsumptionData {
  final DateTime startDate;
  final DateTime endDate;
  final double consumption;

  PeakConsumptionData({
    required this.startDate,
    required this.endDate,
    required this.consumption,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'consumption': consumption,
      };
}