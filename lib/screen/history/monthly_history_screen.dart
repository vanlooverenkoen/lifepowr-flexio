import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/screen/history/history_detail_screen.dart';
import 'package:flexio_kvl/viewmodel/history/monthly_history_viewmodel.dart';
import 'package:flexio_kvl/widget/general/flexio_loading.dart';
import 'package:flexio_kvl/widget/history/monthly_overview/monthly_peak_list_item.dart';
import 'package:flexio_kvl/widget/history/monthly_overview/yearly_peak_list_item.dart';
import 'package:flexio_kvl/widget/provider/provider.dart';
import 'package:flutter/material.dart';

class MonthlyHistoryScreen extends StatefulWidget {
  const MonthlyHistoryScreen({
    super.key,
  });

  @override
  State<MonthlyHistoryScreen> createState() => _MonthlyHistoryScreenState();
}

class _MonthlyHistoryScreenState extends State<MonthlyHistoryScreen> implements MonthlyNavigator {
  @override
  Widget build(BuildContext context) => ProviderWidget<MonthlyHistoryViewModel>(
        create: () => getIt()..init(this),
        consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) {
          if (viewModel.isLoading) return const Center(child: FlexioLoading());
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: viewModel.monthlyPeakConsumptionData.length + (viewModel.yearlyPeak == null ? 0 : 1),
            separatorBuilder: (context, index) {
              if (viewModel.yearlyPeak != null && index == 0) return const SizedBox(height: 32);
              return Container(
                color: theme.colors.backgroundLight,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 2,
              );
            },
            itemBuilder: (context, index) {
              if (viewModel.yearlyPeak != null && index == 0) {
                return YearlyPeakListItem(
                  data: viewModel.yearlyPeak!,
                  onTap: viewModel.onYearlyPeakTapped,
                );
              }
              final adjustedIndex = viewModel.yearlyPeak == null ? index : index - 1;
              final item = viewModel.monthlyPeakConsumptionData[adjustedIndex];
              return MonthlyPeakListItem(
                data: item,
                onTap: () => viewModel.onMonthlyPeakTapped(item),
              );
            },
          );
        },
      );

  @override
  void goToHistoryDetail({int? month}) => Navigator.push(context, MaterialPageRoute<void>(builder: (context) => HistoryDetailScreen(month: month)));
}
