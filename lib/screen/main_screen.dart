import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/screen/home/home_screen.dart';
import 'package:flexio_kvl/viewmodel/main_viewmodel.dart';
import 'package:flexio_kvl/widget/bottom_navigation/bottom_navigation.dart';
import 'package:flexio_kvl/widget/provider/provider.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderWidget<MainViewModel>(
        create: getIt,
        consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => Scaffold(
          body: IndexedStack(
            index: viewModel.currentIndex,
            children: const [
              HomeScreen(),
              SizedBox(),
            ],
          ),
          bottomNavigationBar: BottomNavigation(
            currentIndex: viewModel.currentIndex,
            onTabChanged: viewModel.onTabSelected,
          ),
        ),
      );
}
