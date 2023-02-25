import 'package:fl_chart/fl_chart.dart';
import 'package:flexio_kvl/screen/history/peak_consumption_history_screen.dart';
import 'package:flexio_kvl/viewmodel/history/fl_chart_peak_consumption_viewmodel.dart';
import 'package:flutter/material.dart';

class FlChartPeakConsumptionHistoryScreen extends StatelessWidget {
  const FlChartPeakConsumptionHistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => PeakConsumptionHistoryScreen<FlChartPeakConsumptionViewModel>(
        builder: (context, viewModel) => LineChart(
          key: UniqueKey(),
          chartRendererKey: ValueKey(viewModel.dataType),
          viewModel.lineChartData,
        ),
      );
}
