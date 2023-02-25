import 'package:flexio_kvl/model/history/history_data_type.dart';
import 'package:flexio_kvl/widget/provider/simple_provider.dart';
import 'package:flutter/material.dart';

class HistoryDataTypeSwitch extends StatelessWidget {
  final HistoryDataType dataType;
  final ValueChanged<HistoryDataType> onChanged;

  const HistoryDataTypeSwitch({
    required this.dataType,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleProviderWidget(
      childBuilder: (context, theme, localization) => Row(
        children: [
          Expanded(
            child: Text(
              'Asset',
              textAlign: TextAlign.end,
              style: theme.secondaryText.subtitle,
            ),
          ),
          Switch(
            activeColor: theme.colors.primary,
            activeTrackColor: theme.colors.shadowColor,
            inactiveThumbColor: theme.colors.primary,
            inactiveTrackColor: theme.colors.shadowColor,
            value: dataType == HistoryDataType.dummy,
            onChanged: (bool value) => onChanged(value ? HistoryDataType.dummy : HistoryDataType.asset),
          ),
          Expanded(
            child: Text(
              'Dummy',
              textAlign: TextAlign.start,
              style: theme.secondaryText.subtitle,
            ),
          ),
        ],
      ),
    );
  }
}
