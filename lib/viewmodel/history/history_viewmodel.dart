import 'package:flexio_kvl/model/history/history_type.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class HistoryViewModel with ChangeNotifier {
  var _index = 0;

  HistoryViewModel();

  HistoryType get historyType => HistoryType.values[_index];

  void onTapChartType() {
    _index++;
    if (_index >= HistoryType.values.length) {
      _index = 0;
    }
    notifyListeners();
  }
}
