import 'package:flexio_kvl/util/locale/localization_delegate.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GlobalViewModel with ChangeNotifier {
  final _localization = LocalizationDelegate();

  LocalizationDelegate get localization => _localization;
}
