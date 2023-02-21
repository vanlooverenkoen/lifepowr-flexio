import 'package:flexio_kvl/theme/flexio_theme.dart';
import 'package:flexio_kvl/util/locale/localization.dart';
import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

L _getLocale<L>(BuildContext context) => Localization.of(context) as L;

T _getTheme<T>(BuildContext context) => FlexioTheme.of(context) as T;

Future<void> initArchitecture() async {
  localizationLookup = _getLocale;
  themeLookup = _getTheme;
}