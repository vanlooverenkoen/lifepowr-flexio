import 'package:flexio_kvl/model/history/history_consumption.dart';
import 'package:flexio_kvl/model/history/history_consumption_data.dart';
import 'package:flexio_kvl/widget/history/peak_consumption_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget should look correct', (WidgetTester tester) async {
    final data = HistoryConsumption(
      maxConsumption: 5000,
      minConsumption: 0,
      data: [
        HistoryConsumptionData(
          consumption: 1000,
          startDate: DateTime(2023, 1, 1, 10, 0),
          endDate: DateTime(2023, 1, 1, 10, 15),
          monthlyPeakConsumption: 1500,
          yearlyPeakConsumption: 2000,
        ),
        HistoryConsumptionData(
          consumption: 1100,
          startDate: DateTime(2023, 1, 1, 10, 15),
          endDate: DateTime(2023, 1, 1, 10, 30),
          monthlyPeakConsumption: 1500,
          yearlyPeakConsumption: 2000,
        ),
        HistoryConsumptionData(
          consumption: 1700,
          startDate: DateTime(2023, 1, 1, 10, 30),
          endDate: DateTime(2023, 1, 1, 10, 45),
          monthlyPeakConsumption: 1700,
          yearlyPeakConsumption: 2000,
        ),
        HistoryConsumptionData(
          consumption: 2100,
          startDate: DateTime(2023, 1, 1, 10, 45),
          endDate: DateTime(2023, 1, 1, 11, 00),
          monthlyPeakConsumption: 2100,
          yearlyPeakConsumption: 2100,
        ),
        HistoryConsumptionData(
          consumption: 1300,
          startDate: DateTime(2023, 1, 1, 11, 00),
          endDate: DateTime(2023, 1, 1, 11, 15),
          monthlyPeakConsumption: 2100,
          yearlyPeakConsumption: 2100,
        ),
        HistoryConsumptionData(
          consumption: 1100,
          startDate: DateTime(2023, 1, 1, 11, 15),
          endDate: DateTime(2023, 1, 1, 11, 30),
          monthlyPeakConsumption: 2100,
          yearlyPeakConsumption: 2100,
        ),
      ],
    );
    await tester.pumpWidget(
      Container(
        color: Colors.white,
        child: PeakConsumptionChart(data: data),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(find.byType(PeakConsumptionChart), matchesGoldenFile('chart.png'));
  });
}
