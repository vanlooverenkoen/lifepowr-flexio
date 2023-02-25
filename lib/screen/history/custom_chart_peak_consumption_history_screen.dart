import 'package:flexio_kvl/screen/history/peak_consumption_history_screen.dart';
import 'package:flexio_kvl/viewmodel/history/charts/custom_chart_peak_consumption_viewmodel.dart';
import 'package:flexio_kvl/widget/history/peak_consumption_chart.dart';
import 'package:flutter/material.dart';

class CustomChartConsumptionHistoryScreen extends StatelessWidget {
  const CustomChartConsumptionHistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => PeakConsumptionHistoryScreen<CustomChartPeakConsumptionViewModel>(
        builder: (BuildContext context, CustomChartPeakConsumptionViewModel viewModel) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: PeakConsumptionChart(
            data: viewModel.data,
          ),
        ),
      );
}
