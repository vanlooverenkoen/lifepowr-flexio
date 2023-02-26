import 'package:flexio_kvl/model/history/monthly_overview_data.dart';
import 'package:flexio_kvl/repo/history/history_repository.dart';
import 'package:flexio_kvl/util/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class MonthlyHistoryViewModel with ChangeNotifier {
  final HistoryRepository historyRepository;
  late final MonthlyNavigator _monthlyNavigator;
  var _disposed = false;
  var _isLoading = true;

  MonthlyHistoryData? _yearlyPeak;
  List<MonthlyHistoryData>? _monthlyPeakConsumptionData;

  bool get isLoading => _isLoading;

  MonthlyHistoryData? get yearlyPeak => _yearlyPeak;

  List<MonthlyHistoryData> get monthlyPeakConsumptionData => _monthlyPeakConsumptionData!;

  MonthlyHistoryViewModel(
    this.historyRepository,
  );

  Future<void> init(MonthlyNavigator monthlyNavigator) async {
    _monthlyNavigator = monthlyNavigator;
    await _getData();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  Future<void> _getData() async {
    try {
      _yearlyPeak = null;
      _monthlyPeakConsumptionData = null;
      _isLoading = true;
      notifyListeners();
      _monthlyPeakConsumptionData = await historyRepository.getMonthlyPeakConsumptionData();
      if (monthlyPeakConsumptionData.isNotEmpty) {
        _yearlyPeak = _monthlyPeakConsumptionData!.reduce((value, element) => value.peakConsumption > element.peakConsumption ? value : element);
      }
    } catch (e) {
      FlexioLogger.log(e);
    }
    if (_disposed) return;
    _isLoading = false;
    notifyListeners();
  }

  void onYearlyPeakTapped() => _monthlyNavigator.goToHistoryDetail();

  void onMonthlyPeakTapped(MonthlyHistoryData item) => _monthlyNavigator.goToHistoryDetail(month: item.peakDateTimeStart.month);
}

abstract class MonthlyNavigator {
  void goToHistoryDetail({int? month});
}
