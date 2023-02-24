import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/viewmodel/history/history_viewmodel.dart';
import 'package:flexio_kvl/widget/provider/provider.dart';
import 'package:flexio_kvl/widget/simple_screen.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderWidget<HistoryViewModel>(
        create: getIt,
        consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => SimpleScreen(
          title: 'History',
          subtitle: 'View the history of your energy consumption',
          body: Container(),
        ),
      );
}
