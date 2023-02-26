import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/model/history/history_consumption.dart';
import 'package:flexio_kvl/model/history/history_data_type.dart';
import 'package:flexio_kvl/model/history/monthly_overview_data.dart';
import 'package:flexio_kvl/service/history/history_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class HistoryRepository {
  @factoryMethod
  factory HistoryRepository(
    @Named(dummyHistoryService) HistoryService dummyHistoryService,
    @Named(assetHistoryService) HistoryService assetHistoryService,
  ) = _HistoryRepository;

  Future<HistoryConsumption> getPeakConsumptionData({
    required int? month,
    HistoryDataType dataType = HistoryDataType.dummy,
  });

  Future<List<MonthlyHistoryData>> getMonthlyPeakConsumptionData();
}

class _HistoryRepository implements HistoryRepository {
  final HistoryService _dummyService;
  final HistoryService _assetHistoryService;

  _HistoryRepository(
    this._dummyService,
    this._assetHistoryService,
  );

  @override
  Future<HistoryConsumption> getPeakConsumptionData({
    required int? month,
    HistoryDataType dataType = HistoryDataType.dummy,
  }) async {
    if (dataType == HistoryDataType.dummy) return _dummyService.getHistory(month);
    return _assetHistoryService.getHistory(month);
  }

  @override
  Future<List<MonthlyHistoryData>> getMonthlyPeakConsumptionData() => _assetHistoryService.getMonthlyHistory();
}
