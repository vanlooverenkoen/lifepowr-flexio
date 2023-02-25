import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/viewmodel/home/ev_viewmodel.dart';
import 'package:flexio_kvl/widget/home/ev/ev_info_container.dart';
import 'package:flexio_kvl/widget/home/ev/ev_list_item.dart';
import 'package:flexio_kvl/widget/provider/provider.dart';
import 'package:flutter/material.dart';

class EvScreen extends StatelessWidget {
  const EvScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderWidget<EvViewModel>(
        create: getIt,
        consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => ListView.builder(
          itemCount: viewModel.evChargingBoxes.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == viewModel.evChargingBoxes.length) return const EvInfoContainer();
            final item = viewModel.evChargingBoxes[index];
            return EvListItem(evChargeBox: item);
          },
        ),
      );
}
