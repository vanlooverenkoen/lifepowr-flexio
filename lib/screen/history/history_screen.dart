import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/model/history/history_chart_type.dart';
import 'package:flexio_kvl/model/history/history_data_type.dart';
import 'package:flexio_kvl/screen/history/chart/custom_chart_peak_consumption_history_screen.dart';
import 'package:flexio_kvl/screen/history/chart/fl_chart_peak_consumption_history_screen.dart';
import 'package:flexio_kvl/theme/theme_dimens.dart';
import 'package:flexio_kvl/util/locale/localization.dart';
import 'package:flexio_kvl/viewmodel/history/history_viewmodel.dart';
import 'package:flexio_kvl/widget/general/touch_feedback/touch_feedback.dart';
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
          body: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colors.backgroundLight,
                  borderRadius: BorderRadius.circular(ThemeDimens.cardBorderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colors.shadowColor,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: TouchFeedback(
                  onTap: viewModel.onTapChartType,
                  borderRadius: BorderRadius.circular(ThemeDimens.cardBorderRadius),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _getChartTypeText(viewModel.chartType, localization),
                            style: theme.defaultText.body,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: theme.colors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    switch (viewModel.chartType) {
                      case ChartType.customChartAssets:
                        return CustomChartConsumptionHistoryScreen(
                          dataType: HistoryDataType.asset,
                          key: ValueKey(viewModel.chartType),
                        );
                      case ChartType.customChartDummy:
                        return CustomChartConsumptionHistoryScreen(
                          dataType: HistoryDataType.dummy,
                          key: ValueKey(viewModel.chartType),
                        );
                      case ChartType.flChartAsset:
                        return FlChartPeakConsumptionHistoryScreen(
                          dataType: HistoryDataType.asset,
                          key: ValueKey(viewModel.chartType),
                        );
                      case ChartType.flChartDummy:
                        return FlChartPeakConsumptionHistoryScreen(
                          dataType: HistoryDataType.dummy,
                          key: ValueKey(viewModel.chartType),
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );

  String _getChartTypeText(ChartType chartType, Localization localization) {
    switch (chartType) {
      case ChartType.customChartAssets:
        return 'Custom Chart (Data from assets)';
      case ChartType.customChartDummy:
        return 'Custom Chart (Data from dummy)';
      case ChartType.flChartAsset:
        return 'FL Chart (Data from assets)';
      case ChartType.flChartDummy:
        return 'FL Chart (Data from dummy)';
    }
  }
}
