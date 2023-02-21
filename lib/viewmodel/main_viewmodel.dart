import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainViewModel with ChangeNotifier {
  var _currentIndex = 0;

  int get currentIndex => _currentIndex;

  MainViewModel();

  void onTabSelected(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }
}
