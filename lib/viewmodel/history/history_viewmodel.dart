import 'package:flexio_kvl/model/history/history_chart_type.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class HistoryViewModel with ChangeNotifier {
  var _index = 0;

  HistoryViewModel();

  ChartType get chartType => ChartType.values[_index];

  void onTapChartType() {
    _index++;
    if (_index >= ChartType.values.length) {
      _index = 0;
    }
    notifyListeners();
  }
}
