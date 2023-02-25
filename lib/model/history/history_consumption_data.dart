import 'package:flutter/foundation.dart';

@immutable
class HistoryConsumptionData {
  final DateTime startDate;
  final DateTime endDate;
  final double monthlyPeakConsumption;
  final double yearlyPeakConsumption;
  final double consumption;

  const HistoryConsumptionData({
    required this.startDate,
    required this.endDate,
    required this.consumption,
    required this.monthlyPeakConsumption,
    required this.yearlyPeakConsumption,
  });
}
