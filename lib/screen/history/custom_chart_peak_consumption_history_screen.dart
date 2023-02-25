import 'package:flexio_kvl/screen/history/peak_consumption_history_screen.dart';
import 'package:flexio_kvl/viewmodel/history/custom_chart_peak_consumption_viewmodel.dart';
import 'package:flutter/material.dart';

class CustomChartConsumptionHistoryScreen extends StatelessWidget {
  const CustomChartConsumptionHistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => PeakConsumptionHistoryScreen<CustomChartPeakConsumptionViewModel>(
        builder: (BuildContext context, CustomChartPeakConsumptionViewModel viewModel) => Container(),
      );
}
