import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/model/history/history_chart_type.dart';
import 'package:flexio_kvl/screen/history/custom_chart_peak_consumption_history_screen.dart';
import 'package:flexio_kvl/screen/history/fl_chart_peak_consumption_history_screen.dart';
import 'package:flexio_kvl/viewmodel/history/history_viewmodel.dart';
import 'package:flexio_kvl/widget/provider/provider.dart';
import 'package:flexio_kvl/widget/simple_screen.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderWidget<HistoryViewModel>(
        create: getIt,
        consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => SimpleScreen(
          title: 'History',
          subtitle: 'View the history of your energy consumption',
          body: Builder(
            builder: (context) {
              switch(viewModel.chartType) {
                case ChartType.flChart:
                  return const FlChartPeakConsumptionHistoryScreen();
                case ChartType.customChart:
                  return const CustomChartConsumptionHistoryScreen();
              }
            }
          ),
        ),
      );
}
