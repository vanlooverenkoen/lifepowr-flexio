import 'package:flexio_kvl/model/history/history_consumption.dart';
import 'package:flexio_kvl/model/history/monthly_overview_data.dart';

abstract class HistoryService {
  Future<HistoryConsumption> getHistory(int? month);

  Future<List<MonthlyHistoryData>> getMonthlyHistory();
}
