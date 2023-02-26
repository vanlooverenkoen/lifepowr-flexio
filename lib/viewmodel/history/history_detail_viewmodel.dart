import 'package:flexio_kvl/model/history/history_type.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
class HistoryDetailViewModel with ChangeNotifier {
  late int? _month;

  int? get month => _month;

  HistoryDetailViewModel();

  String get title {
    if (_month == null) return 'Yearly';
    return DateFormat('MMMM').format(DateTime(DateTime.now().year, _month!));
  }

  Future<void> init(int? month) async {
    _month = month;
  }

  var _index = 0;

  HistoryType get historyType => HistoryType.values[_index];

  void onHistoryTypeTapped() {
    _index++;
    if (_index >= HistoryType.values.length) {
      _index = 0;
    }
    notifyListeners();
  }
}
