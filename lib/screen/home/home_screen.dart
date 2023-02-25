import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/screen/home/ev_screen.dart';
import 'package:flexio_kvl/screen/home/real_time_screen.dart';
import 'package:flexio_kvl/screen/home/savings_screen.dart';
import 'package:flexio_kvl/viewmodel/home/home_viewmodel.dart';
import 'package:flexio_kvl/widget/general/page_view/flexio_page_view.dart';
import 'package:flexio_kvl/widget/provider/provider.dart';
import 'package:flexio_kvl/widget/simple_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderWidget<HomeViewModel>(
        create: getIt,
        consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => const SimpleScreen(
          title: 'My FlexiO',
          subtitle: 'View your savings, real-time energie consumption and change some settings of your electric vehicle.',
          body: FlexioPageView(
            tabs: ['Saving', 'Real Time', 'Ev'],
            pages: [
              SavingsScreen(),
              RealTimeScreen(),
              EvScreen(),
            ],
          ),
        ),
      );
}
