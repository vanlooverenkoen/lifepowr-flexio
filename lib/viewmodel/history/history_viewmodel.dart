import 'package:flexio_kvl/util/logger/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class HistoryViewModel with ChangeNotifier {
  void onHistoryTypeTapped() => FlexioLogger.log('This should be implemented in production to switch between the different history types.');
}
