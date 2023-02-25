import 'dart:math';

import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/model/history/history_consumption.dart';
import 'package:flexio_kvl/model/history/history_consumption_data.dart';
import 'package:flexio_kvl/service/history/history_service.dart';
import 'package:flexio_kvl/theme/theme_assets.dart';
import 'package:flexio_kvl/theme/theme_durations.dart';
import 'package:flexio_kvl/util/logger/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@Named(assetHistoryService)
@LazySingleton(as: HistoryService)
class HistoryAssetService extends HistoryService {
  static const kwhFactor = 4;
  static const wattFactor = 1000;
  static const _startingYearlyConsumption = 4500.0;
  HistoryConsumption? cache;

  @override
  Future<HistoryConsumption> getHistory() async {
    final cache = this.cache;
    if (cache != null) {
      await Future<void>.delayed(ThemeDurations.demoApiDuration);
      return cache;
    }
    final text = await rootBundle.loadString(ThemeAssets.historyCsv);
    final result = await compute(parseCsv, text);
    this.cache = result;
    return result;
  }

  Future<HistoryConsumption> parseCsv(String text) async {
    final history = <HistoryConsumptionData>[];
    var monthlyPeakConsumption = 0.0;
    var yearlyPeakConsumption = _startingYearlyConsumption;
    final trimmedText = text.trim();
    final lines = trimmedText.split('\n');
    lines.removeAt(0);
    final dateFormatter = DateFormat('dd-MM-yyyy HH:mm:ss');
    for (final line in lines) {
      final trimmedLine = line.trim();
      try {
        final rows = trimmedLine.split(';');
        final startDate = rows[0];
        final startTime = rows[1];
        final startDateTime = dateFormatter.parse('$startDate $startTime');
        final endDate = rows[2];
        final endTime = rows[3];
        final endDateTime = dateFormatter.parse('$endDate $endTime');
        final volume = double.tryParse(rows[8].replaceAll(',', '.'));
        if (volume == null) continue;
        final consumption = volume * kwhFactor * wattFactor;
        final type = rows[10];
        if (type != 'Gevalideerd') continue;
        monthlyPeakConsumption = max(monthlyPeakConsumption, consumption);
        yearlyPeakConsumption = max(monthlyPeakConsumption, yearlyPeakConsumption);
        history.add(HistoryConsumptionData(
          startDate: startDateTime,
          endDate: endDateTime,
          consumption: consumption,
          monthlyPeakConsumption: monthlyPeakConsumption,
          yearlyPeakConsumption: yearlyPeakConsumption,
        ));
      } catch (e) {
        FlexioLogger.log('Failed to parse line: $trimmedLine\n\n$e');
      }
    }
    return HistoryConsumption(
      data: history,
      minConsumption: 0,
      maxConsumption: yearlyPeakConsumption,
    );
  }
}
