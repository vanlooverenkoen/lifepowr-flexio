import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/model/history/history_consumption_data.dart';
import 'package:flexio_kvl/model/history/history_data_type.dart';
import 'package:flexio_kvl/service/history/history_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class HistoryRepository {
  @factoryMethod
  factory HistoryRepository(
    @Named(dummyHistoryService) HistoryService dummyHistoryService,
    @Named(assetHistoryService) HistoryService assetHistoryService,
  ) = _HistoryRepository;

  Future<List<HistoryConsumptionItem>> getPeakConsumptionData({HistoryDataType dataType = HistoryDataType.dummy});
}

class _HistoryRepository implements HistoryRepository {
  final HistoryService _dummyService;
  final HistoryService _assetHistoryService;

  _HistoryRepository(
    this._dummyService,
    this._assetHistoryService,
  );

  @override
  Future<List<HistoryConsumptionItem>> getPeakConsumptionData({HistoryDataType dataType = HistoryDataType.dummy}) async {
    if (dataType == HistoryDataType.dummy) return _dummyService.getHistory();
    return _assetHistoryService.getHistory();
  }
}