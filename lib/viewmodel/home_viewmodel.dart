import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel with ChangeNotifier {
  var _counter = 0;

  int get counter => _counter;

  HomeViewModel();

  void onIncrement() {
    _counter++;
    notifyListeners();
  }
}
