import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/viewmodel/history/peak_consumption_viewmodel.dart';
import 'package:flexio_kvl/widget/general/history_data_type_switch.dart';
import 'package:flexio_kvl/widget/provider/provider.dart';
import 'package:flutter/material.dart';

typedef ChartBuilder<T extends PeakConsumptionViewModel> = Widget Function(BuildContext context, T viewModel);

class PeakConsumptionHistoryScreen<T extends PeakConsumptionViewModel> extends StatelessWidget {
  final ChartBuilder<T> builder;

  const PeakConsumptionHistoryScreen({
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderWidget<T>(
        create: () => getIt()..init(),
        consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) {
          if (viewModel.isLoading) return const Center(child: CircularProgressIndicator());
          return Column(
            children: [
              HistoryDataTypeSwitch(
                dataType: viewModel.dataType,
                onChanged: viewModel.onDataTypeChanged,
              ),
              Expanded(
                child: builder(context, viewModel),
              ),
            ],
          );
        },
      );
}
