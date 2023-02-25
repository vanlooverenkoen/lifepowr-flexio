import 'package:flutter/foundation.dart';

@immutable
class HistoryConsumptionItem {
  final DateTime startDate;
  final DateTime endDate;
  final double monthlyPeakConsumption;
  final double yearlyPeakConsumption;
  final double consumption;

  const HistoryConsumptionItem({
    required this.startDate,
    required this.endDate,
    required this.consumption,
    required this.monthlyPeakConsumption,
    required this.yearlyPeakConsumption,
  });
}
