import 'dart:math';

import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/model/history/history_consumption.dart';
import 'package:flexio_kvl/model/history/history_consumption_data.dart';
import 'package:flexio_kvl/model/history/monthly_overview_data.dart';
import 'package:flexio_kvl/service/history/history_service.dart';
import 'package:flexio_kvl/theme/theme_durations.dart';
import 'package:injectable/injectable.dart';

@Named(dummyHistoryService)
@LazySingleton(as: HistoryService)
class HistoryDummyService extends HistoryService {
  static const _amountOfDataPoints = 3000;
  static const _startingYearlyConsumption = 4500.0;
  static const _defaultMaxNextInt = 4000;
  static const _highMaxNextInt = 8000;
  static const _amountOfSpikes = 10;
  static const _spikesStartingAt = 1500;
  static const _spikeConsumption = 5000.0;

  @override
  Future<HistoryConsumption> getHistory() async {
    await Future<void>.delayed(ThemeDurations.demoApiDuration);
    final history = <HistoryConsumptionData>[];
    var monthlyPeakConsumption = 0.0;
    var yearlyPeakConsumption = _startingYearlyConsumption;
    var date = DateTime.now();
    final random = Random();
    final spikes = List.generate(_amountOfSpikes, (index) => Random().nextInt(_amountOfDataPoints - _spikesStartingAt) + _spikesStartingAt);
    for (var i = 0; i < _amountOfDataPoints; ++i) {
      final startDate = date;
      date = date.add(const Duration(minutes: 15));
      double consumption;
      if (i > 500 && i < 1000) {
        consumption = random.nextInt(_highMaxNextInt).toDouble();
      } else if (spikes.contains(i)) {
        consumption = _spikeConsumption;
      } else {
        consumption = random.nextInt(_defaultMaxNextInt).toDouble();
      }
      monthlyPeakConsumption = max(monthlyPeakConsumption, consumption);
      yearlyPeakConsumption = max(monthlyPeakConsumption, yearlyPeakConsumption);
      history.add(HistoryConsumptionData(
        startDate: startDate,
        endDate: date,
        consumption: consumption,
        monthlyPeakConsumption: monthlyPeakConsumption,
        yearlyPeakConsumption: yearlyPeakConsumption,
      ));
    }
    return HistoryConsumption(
      data: history,
      minConsumption: 0,
      maxConsumption: yearlyPeakConsumption,
    );
  }

  @override
  Future<List<MonthlyHistoryData>> getMonthlyHistory() {
    throw UnimplementedError();
  }
}
