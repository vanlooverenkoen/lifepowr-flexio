import 'package:flexio_kvl/model/history/history_chart_type.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class HistoryViewModel with ChangeNotifier {
  final _chartType = ChartType.customChart;

  HistoryViewModel();

  ChartType get chartType => _chartType;
}
