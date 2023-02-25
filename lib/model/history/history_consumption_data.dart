import 'package:flutter/foundation.dart';

@immutable
class HistoryConsumptionItem {
  final DateTime date;
  final double monthlyPeakConsumption;
  final double yearlyPeakConsumption;
  final double consumption;

  const HistoryConsumptionItem({
    required this.date,
    required this.consumption,
    required this.monthlyPeakConsumption,
    required this.yearlyPeakConsumption,
  });
}
