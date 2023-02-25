import 'package:flexio_kvl/model/history/history_data_type.dart';
import 'package:flexio_kvl/screen/history/chart/peak_consumption_history_screen.dart';
import 'package:flexio_kvl/viewmodel/history/charts/custom_chart_peak_consumption_viewmodel.dart';
import 'package:flexio_kvl/widget/history/peak_consumption_chart.dart';
import 'package:flutter/material.dart';

class CustomChartConsumptionHistoryScreen extends StatelessWidget {
  final HistoryDataType dataType;

  const CustomChartConsumptionHistoryScreen({
    required this.dataType,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PeakConsumptionHistoryScreen<CustomChartPeakConsumptionViewModel>(
        dataType: dataType,
        builder: (BuildContext context, CustomChartPeakConsumptionViewModel viewModel) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: PeakConsumptionChart(
            data: viewModel.data,
          ),
        ),
      );
}
