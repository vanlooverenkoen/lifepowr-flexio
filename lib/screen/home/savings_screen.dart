import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/theme/theme_assets.dart';
import 'package:flexio_kvl/viewmodel/home/savings_viewmodel.dart';
import 'package:flexio_kvl/widget/home/adaptive_aspect_ratio.dart';
import 'package:flexio_kvl/widget/provider/provider.dart';
import 'package:flutter/material.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderWidget<SavingsViewModel>(
        create: getIt,
        consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => ListView(
          children: [
            const SizedBox(height: 32),
            /// I am using an image here for demo purposes, but this should be a graph drown on canvas in a real app
            AdaptiveRatio(
              child: Image.asset(ThemeAssets.savingsGraph),
            ),
          ],
        ),
      );
}
