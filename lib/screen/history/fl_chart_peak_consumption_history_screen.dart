import 'package:flexio_kvl/di/injectable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flexio_kvl/viewmodel/history/fl_chart_peak_consumption_viewmodel.dart';
import 'package:flexio_kvl/widget/provider/provider.dart';
import 'package:flutter/material.dart';

class PeakConsumptionHistoryScreen extends StatelessWidget {
  const PeakConsumptionHistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderWidget<PeakConsumptionViewModel>(
        create: () => getIt()..init(),
        consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) {
          if (viewModel.isLoading) return const Center(child: CircularProgressIndicator());
          return LayoutBuilder(
            builder: (context, constraints) => RefreshIndicator(
              onRefresh: viewModel.onRefresh,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  SizedBox(
                    width: constraints.maxWidth - 32,
                    height: constraints.maxHeight - 32,
                    child: LineChart(
                      viewModel.lineChartData,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
