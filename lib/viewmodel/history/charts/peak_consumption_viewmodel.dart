import 'package:flexio_kvl/model/history/history_consumption.dart';
import 'package:flexio_kvl/model/history/history_data_type.dart';
import 'package:flexio_kvl/repo/history/history_repository.dart';
import 'package:flexio_kvl/util/logger/logger.dart';
import 'package:flutter/material.dart';

abstract class PeakConsumptionViewModel with ChangeNotifier {
  final HistoryRepository historyRepository;
  var _disposed = false;
  var _isLoading = true;

  late final HistoryDataType _dataType;
  late final int? _month;

  bool get isLoading => _isLoading;

  HistoryDataType get dataType => _dataType;

  PeakConsumptionViewModel(this.historyRepository);

  Future<void> init(int? month, HistoryDataType dataType) async {
    _month = month;
    _dataType = dataType;
    await _getData();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  Future<void> _getData() async {
    try {
      _isLoading = true;
      notifyListeners();
      final data = await historyRepository.getPeakConsumptionData(
        month: _month,
        dataType: _dataType,
      );
      if (_disposed) return;
      await processData(data);
    } catch (e) {
      FlexioLogger.log(e);
    }
    if (_disposed) return;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> processData(HistoryConsumption data);
}
