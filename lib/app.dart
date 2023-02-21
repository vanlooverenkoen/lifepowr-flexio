import 'package:flexio_kvl/di/injectable.dart';
import 'package:flexio_kvl/screen/home_screen.dart';
import 'package:flexio_kvl/util/locale/localization_delegate.dart';
import 'package:flexio_kvl/viewmodel/global_viewmodel.dart';
import 'package:flexio_kvl/widget/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FlexioApp extends StatelessWidget {
  const FlexioApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalViewModel>(
      create: getIt,
      consumer: (context, viewModel, child) => MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        supportedLocales: LocalizationDelegate.supportedLocales,
        localizationsDelegates: [
          viewModel.localization,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: const MyHomePage(),
      ),
    );
  }
}
