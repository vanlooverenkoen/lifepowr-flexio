import 'package:flexio_kvl/model/history/history_consumption.dart';
import 'package:flexio_kvl/model/history/history_data_type.dart';
import 'package:flexio_kvl/repo/history/history_repository.dart';
import 'package:flexio_kvl/util/logger/logger.dart';
import 'package:flutter/material.dart';

abstract class PeakConsumptionViewModel with ChangeNotifier {
  final HistoryRepository historyRepository;

  var _isLoading = true;

  var _dataType = HistoryDataType.asset;

  bool get isLoading => _isLoading;

  HistoryDataType get dataType => _dataType;

  PeakConsumptionViewModel(this.historyRepository);

  Future<void> init() async {
    await _getData();
  }

  Future<void> _getData() async {
    try {
      _isLoading = true;
      notifyListeners();
      final data = await historyRepository.getPeakConsumptionData(dataType: _dataType);
      await processData(data);
    } catch (e) {
      FlexioLogger.log(e);
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> processData(HistoryConsumption data);

  void onDataTypeChanged(HistoryDataType value) {
    if (_dataType == value) return;
    _dataType = value;
    notifyListeners();
    _getData();
  }
}
