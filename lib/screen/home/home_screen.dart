import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/viewmodel/home/home_viewmodel.dart';
import 'package:flexio_kvl/widget/provider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ProviderWidget<HomeViewModel>(
        create: getIt,
        consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => Scaffold(
          appBar: AppBar(title: Text(localization.title)),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(localization.homeLabel),
                Text(
                  viewModel.counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: viewModel.onIncrement,
            child: const Icon(Icons.add),
          ),
        ),
      );
}
