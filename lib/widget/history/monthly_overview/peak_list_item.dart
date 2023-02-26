import 'package:flexio_kvl/model/history/monthly_overview_data.dart';
import 'package:flexio_kvl/widget/general/touch_feedback/touch_feedback.dart';
import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class PeakListItem extends StatelessWidget {
  final String title;
  final MonthlyHistoryData data;
  final VoidCallback onTap;

  const PeakListItem({
    required this.title,
    required this.data,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('E d MMM');
    final timeFormatter = DateFormat('HH:mm');
    return SimpleProviderWidget(
      childBuilder: (context, theme, localization) => TouchFeedback(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: theme.defaultText.titleSmall,
                    ),
                  ),
                  Text(
                    '${data.peakConsumption.toStringAsFixed(2)} kWh',
                    style: theme.primaryText.titleSmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '${dateFormatter.format(data.peakDateTimeStart)} ${timeFormatter.format(data.peakDateTimeStart)} - ${timeFormatter.format(data.peakDateTimeEnd)}',
                style: theme.subtleText.body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
