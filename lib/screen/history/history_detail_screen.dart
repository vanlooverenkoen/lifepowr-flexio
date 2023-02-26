import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/model/history/history_data_type.dart';
import 'package:flexio_kvl/model/history/history_type.dart';
import 'package:flexio_kvl/screen/history/chart/custom_chart_peak_consumption_history_screen.dart';
import 'package:flexio_kvl/screen/history/chart/fl_chart_peak_consumption_history_screen.dart';
import 'package:flexio_kvl/util/locale/localization.dart';
import 'package:flexio_kvl/viewmodel/history/history_detail_viewmodel.dart';
import 'package:flexio_kvl/widget/general/selector_widget.dart';
import 'package:flexio_kvl/widget/provider/provider.dart';
import 'package:flexio_kvl/widget/simple_screen.dart';
import 'package:flutter/material.dart';

class HistoryDetailScreen extends StatelessWidget {
  final int? month;

  const HistoryDetailScreen({
    required this.month,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderWidget<HistoryDetailViewModel>(
      create: () => getIt()..init(month),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => SimpleScreen(
            title: viewModel.title,
            canGoBack: true,
            subtitle: 'View the history of your energy consumption',
            body: Column(
              children: [
                SelectorWidget(
                  title: _getChartTypeText(viewModel.historyType, localization),
                  onTap: viewModel.onHistoryTypeTapped,
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final key = ValueKey('${viewModel.historyType}-${viewModel.month}');
                      switch (viewModel.historyType) {
                        case HistoryType.customChartAssets:
                          return CustomChartConsumptionHistoryScreen(
                            key: key,
                            dataType: HistoryDataType.asset,
                            month: viewModel.month,
                          );
                        case HistoryType.customChartDummy:
                          return CustomChartConsumptionHistoryScreen(
                            key: key,
                            dataType: HistoryDataType.dummy,
                            month: viewModel.month,
                          );
                        case HistoryType.flChartAsset:
                          return FlChartPeakConsumptionHistoryScreen(
                            key: key,
                            dataType: HistoryDataType.asset,
                            month: viewModel.month,
                          );
                        case HistoryType.flChartDummy:
                          return FlChartPeakConsumptionHistoryScreen(
                            key: key,
                            dataType: HistoryDataType.dummy,
                            month: viewModel.month,
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ));

  String _getChartTypeText(HistoryType chartType, Localization localization) {
    switch (chartType) {
      case HistoryType.customChartAssets:
        return 'Custom Chart (Data from assets)';
      case HistoryType.customChartDummy:
        return 'Custom Chart (Data from dummy)';
      case HistoryType.flChartAsset:
        return 'FL Chart (Data from assets)';
      case HistoryType.flChartDummy:
        return 'FL Chart (Data from dummy)';
    }
  }
}
