import 'package:flexio_kvl/model/history/history_consumption_data.dart';

abstract class HistoryService {
  Future<List<HistoryConsumptionItem>> getHistory();
}
