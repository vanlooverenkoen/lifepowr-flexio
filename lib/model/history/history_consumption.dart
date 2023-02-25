import 'package:flexio_kvl/model/history/history_consumption_data.dart';
import 'package:flutter/foundation.dart';

@immutable
class HistoryConsumption {
  final double maxConsumption;
  final double minConsumption;
  final List<HistoryConsumptionData> data;

  const HistoryConsumption({
    required this.data,
    required this.maxConsumption,
    required this.minConsumption,
  });
}
