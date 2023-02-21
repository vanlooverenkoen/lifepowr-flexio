import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/viewmodel/home_viewmodel.dart';
import 'package:flexio_kvl/widget/provider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) => ProviderWidget<HomeViewModel>(
        create: getIt,
        consumerWithThemeAndLocalization: (context, viewMode, child, theme, localization) => Scaffold(
          appBar: AppBar(title: Text(localization.title)),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      );
}
