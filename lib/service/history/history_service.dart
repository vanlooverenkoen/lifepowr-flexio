import 'package:flexio_kvl/model/history/history_consumption.dart';

abstract class HistoryService {
  Future<HistoryConsumption> getHistory();
}
