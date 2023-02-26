import 'dart:convert';
import 'dart:math';

import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/model/history/history_consumption.dart';
import 'package:flexio_kvl/model/history/history_consumption_data.dart';
import 'package:flexio_kvl/model/history/monthly_overview_data.dart';
import 'package:flexio_kvl/model/history/peak_coonsumption_data.dart';
import 'package:flexio_kvl/service/history/history_service.dart';
import 'package:flexio_kvl/theme/theme_assets.dart';
import 'package:flexio_kvl/theme/theme_durations.dart';
import 'package:flexio_kvl/util/logger/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Named(assetHistoryService)
@LazySingleton(as: HistoryService)
class HistoryAssetService extends HistoryService {
  static const _kwhFactor = 4;
  static const _wattFactor = 1000;
  final _cache = <int?, HistoryConsumption>{};

  @override
  Future<HistoryConsumption> getHistory(int? month) async {
    final cache = _cache[month];
    if (cache != null) {
      await Future<void>.delayed(ThemeDurations.demoApiDuration);
      return cache;
    }
    String text;
    if (month == null) {
      text = await rootBundle.loadString(ThemeAssets.historyAll);
    } else {
      text = await rootBundle.loadString(ThemeAssets.historyMonth(month));
    }

    final yearlyPeakConsumption = await _getStartingYearlyConsumptionForMonth(month);
    final result = await compute(parseData, ComputeData(yearlyPeakConsumption, text));
    _cache[month] = result;
    return result;
  }

  Future<HistoryConsumption> parseData(ComputeData computeData) async {
    final history = <HistoryConsumptionData>[];
    var monthlyPeakConsumption = 0.0;
    var yearlyPeakConsumption = computeData.yearlyPeakConsumption;
    final jsonList = jsonDecode(computeData.text) as List<dynamic>;
    final data = jsonList.map((dynamic e) => PeakConsumptionData.fromJson(e as Map<String, dynamic>)).toList();
    for (final item in data) {
      try {
        final consumption = item.consumption * _kwhFactor * _wattFactor;
        monthlyPeakConsumption = max(monthlyPeakConsumption, consumption);
        yearlyPeakConsumption = max(monthlyPeakConsumption, yearlyPeakConsumption);
        history.add(HistoryConsumptionData(
          startDate: item.startDate,
          endDate: item.endDate,
          consumption: consumption,
          monthlyPeakConsumption: monthlyPeakConsumption,
          yearlyPeakConsumption: yearlyPeakConsumption,
        ));
      } catch (e) {
        FlexioLogger.log('Failed to parse\n\n$e');
      }
    }
    return HistoryConsumption(
      data: history,
      minConsumption: 0,
      maxConsumption: yearlyPeakConsumption,
    );
  }

  @override
  Future<List<MonthlyHistoryData>> getMonthlyHistory() async {
    final text = await rootBundle.loadString(ThemeAssets.monthlyOverview);
    final list = jsonDecode(text) as List<dynamic>;
    return list.map((dynamic e) => MonthlyHistoryData.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<double> _getStartingYearlyConsumptionForMonth(int? month) async {
    if (month == null) return 0;
    final data = await getMonthlyHistory();
    final monthsForStartingValue = data.where((element) => element.month < month);
    double yearlyConsumption = 0.0;
    for (final monthForStartingValue in monthsForStartingValue) {
      yearlyConsumption = max(yearlyConsumption, monthForStartingValue.peakConsumption);
    }
    return yearlyConsumption * _kwhFactor * _wattFactor;
  }
}

class ComputeData {
  final double yearlyPeakConsumption;
  final String text;

  ComputeData(
    this.yearlyPeakConsumption,
    this.text,
  );
}
