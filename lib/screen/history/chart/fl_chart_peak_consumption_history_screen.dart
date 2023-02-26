import 'package:fl_chart/fl_chart.dart';
import 'package:flexio_kvl/model/history/history_data_type.dart';
import 'package:flexio_kvl/screen/history/chart/peak_consumption_history_screen.dart';
import 'package:flexio_kvl/viewmodel/history/charts/fl_chart_peak_consumption_viewmodel.dart';
import 'package:flutter/material.dart';

class FlChartPeakConsumptionHistoryScreen extends StatelessWidget {
  final int? month;
  final HistoryDataType dataType;

  const FlChartPeakConsumptionHistoryScreen({
    required this.month,
    required this.dataType,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PeakConsumptionHistoryScreen<FlChartPeakConsumptionViewModel>(
    month: month,
        dataType: dataType,
        builder: (context, viewModel) => LineChart(
          key: UniqueKey(),
          chartRendererKey: ValueKey(viewModel.dataType),
          viewModel.lineChartData,
        ),
      );
}
