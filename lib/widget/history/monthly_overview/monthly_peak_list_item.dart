import 'package:flexio_kvl/model/history/monthly_overview_data.dart';
import 'package:flexio_kvl/widget/history/monthly_overview/peak_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class MonthlyPeakListItem extends StatelessWidget {
  final MonthlyHistoryData data;
  final VoidCallback onTap;

  const MonthlyPeakListItem({
    required this.data,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final monthFormatter = DateFormat('MMMM');
    return PeakListItem(
      title: monthFormatter.format(data.peakDateTimeStart),
      data: data,
      onTap: onTap,
    );
  }
}
