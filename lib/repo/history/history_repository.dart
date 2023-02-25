import 'package:flexio_kvl/model/history/history_consumption_data.dart';
import 'package:flexio_kvl/service/history/history_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class HistoryRepository {
  @factoryMethod
  factory HistoryRepository(HistoryService service) = _HistoryRepository;

  Future<List<HistoryConsumptionItem>> getHistory(DateTime startDate, DateTime endDate);
}

class _HistoryRepository implements HistoryRepository {
  final HistoryService _historyService;

  _HistoryRepository(this._historyService);

  @override
  Future<List<HistoryConsumptionItem>> getHistory(DateTime startDate, DateTime endDate) async => _historyService.getHistory(startDate, endDate);
}
