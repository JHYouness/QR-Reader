import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOption = 1;
  int get selectedMenuOption {
    return _selectedMenuOption;
  }

  set selectedMenuOption(int i) {
    _selectedMenuOption = i;

    //Cuando el valor cambie es necesario llamar al metodo notifyListeners para que los elementos que escuchen esta clase cambien
    notifyListeners();
  }
}
