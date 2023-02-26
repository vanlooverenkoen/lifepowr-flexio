class MonthlyHistoryData {
  final int month;
  final DateTime peakDateTimeStart;
  final DateTime peakDateTimeEnd;
  final double peakConsumption;

  MonthlyHistoryData(
    this.month,
    this.peakDateTimeStart,
    this.peakDateTimeEnd,
    this.peakConsumption,
  );

  MonthlyHistoryData.fromJson(Map<String, dynamic> json)
      : month = json['month'] as int,
        peakDateTimeStart = DateTime.parse(json['peakDateTimeStart'] as String),
        peakDateTimeEnd = DateTime.parse(json['peakDateTimeEnd'] as String),
        peakConsumption = json['peakConsumption'] as double;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'month': month,
        'peakDateTimeStart': peakDateTimeStart.toIso8601String(),
        'peakDateTimeEnd': peakDateTimeEnd.toIso8601String(),
        'peakConsumption': peakConsumption,
      };
}
