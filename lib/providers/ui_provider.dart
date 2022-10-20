import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  var _selectedMenuOption = 0;

  get selectedMenuOpt {
    return _selectedMenuOption;
  }

  set selectedMenuOption(int i) {
    _selectedMenuOption = i;
  notifyListeners();
  }

}
