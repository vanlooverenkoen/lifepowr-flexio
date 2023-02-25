import 'package:flexio_kvl/model/history/history_consumption.dart';
import 'package:flexio_kvl/viewmodel/history/charts/peak_consumption_viewmodel.dart';
import 'package:injectable/injectable.dart';

@injectable
class CustomChartPeakConsumptionViewModel extends PeakConsumptionViewModel {
  HistoryConsumption? _data;

  HistoryConsumption get data => _data!;

  CustomChartPeakConsumptionViewModel(super.historyRepository);

  @override
  Future<void> processData(HistoryConsumption data) async {
    _data = data;
    notifyListeners();
  }
}
