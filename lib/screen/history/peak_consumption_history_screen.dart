import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/viewmodel/history/charts/peak_consumption_viewmodel.dart';
import 'package:flexio_kvl/widget/general/flexio_loading.dart';
import 'package:flexio_kvl/widget/general/history_data_type_switch.dart';
import 'package:flexio_kvl/widget/history/consumption_type_widget.dart';
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
        consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => Column(
          children: [
            HistoryDataTypeSwitch(
              dataType: viewModel.dataType,
              onChanged: viewModel.onDataTypeChanged,
            ),
            if (viewModel.isLoading) ...[
              const Expanded(
                child: Center(
                  child: FlexioLoading(),
                ),
              ),
            ] else ...[
              Expanded(
                child: builder(context, viewModel),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: const [
                  ConsumptionTypeWidget(
                    title: 'Monthly peak consumption',
                    color: Colors.grey,
                  ),
                  ConsumptionTypeWidget(
                    title: 'Yearly peak consumption',
                    color: Colors.purple,
                  ),
                  ConsumptionTypeWidget(
                    title: 'Consumption',
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ],
        ),
      );
}
