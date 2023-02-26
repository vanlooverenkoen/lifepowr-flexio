import 'package:flexio_kvl/model/history/monthly_overview_data.dart';
import 'package:flexio_kvl/widget/history/monthly_overview/peak_list_item.dart';
import 'package:flutter/widgets.dart';

class YearlyPeakListItem extends StatelessWidget {
  final MonthlyHistoryData data;
  final VoidCallback onTap;

  const YearlyPeakListItem({
    required this.data,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PeakListItem(
        title: 'Yearly',
        data: data,
        onTap: onTap,
      );
}
