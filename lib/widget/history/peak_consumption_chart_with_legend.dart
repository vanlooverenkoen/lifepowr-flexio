import 'package:flexio_kvl/model/history/history_consumption.dart';
import 'package:flexio_kvl/widget/history/peak_consumption_chart.dart';
import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/material.dart';

class PeakConsumptionChartWithLegend extends StatelessWidget {
  static const _amountOfLegendItems = 9;
  final HistoryConsumption data;

  const PeakConsumptionChartWithLegend({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleProviderWidget(
      childBuilder: (context, theme, localization) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Watt',
            style: theme.secondaryText.subtitle,
          ),
          Expanded(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data.maxConsumption.toStringAsFixed(0),
                      style: theme.secondaryText.body,
                    ),
                    for (var i = _amountOfLegendItems - 1; i > 1; --i)
                      Expanded(
                        child: Center(
                          child: Text(
                            ((data.maxConsumption / _amountOfLegendItems) * i).toStringAsFixed(0),
                            style: theme.secondaryText.body,
                          ),
                        ),
                      ),
                    Text(
                      data.minConsumption.toStringAsFixed(0),
                      style: theme.secondaryText.body,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: PeakConsumptionChart(data: data),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
