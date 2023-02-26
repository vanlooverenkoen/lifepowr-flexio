class PeakConsumptionData {
  final DateTime startDate;
  final DateTime endDate;
  final double consumption;

  PeakConsumptionData({
    required this.startDate,
    required this.endDate,
    required this.consumption,
  });

  factory PeakConsumptionData.fromJson(Map<String, dynamic> json) => PeakConsumptionData(
        startDate: DateTime.parse(json['startDate'] as String),
        endDate: DateTime.parse(json['endDate'] as String),
        consumption: json['consumption'] as double,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'consumption': consumption,
      };
}
