import 'package:flexio_kvl/model/history/history_consumption_data.dart';
import 'package:flexio_kvl/viewmodel/history/peak_consumption_viewmodel.dart';
import 'package:injectable/injectable.dart';

@injectable
class CustomChartPeakConsumptionViewModel extends PeakConsumptionViewModel {
  List<HistoryConsumptionItem>? _data;

  List<HistoryConsumptionItem> get lineChartData => _data!;

  CustomChartPeakConsumptionViewModel(super.historyRepository);

  @override
  Future<void> processData(List<HistoryConsumptionItem> data) async {
    _data = _data;
    notifyListeners();
  }
}
