import 'package:flutter/material.dart';

import 'theme_color.dart';


class ThemeNotifier extends ChangeNotifier {
  final key = "theme";
  bool _darkMode = false;
  ThemeColor _themeColor = ThemeColor.green;

  ThemeNotifier();

  bool get darkMode => _darkMode;
  ThemeColor get themeColor => _themeColor;

  toggleTheme(){
    _darkMode = !_darkMode;
    notifyListeners();
  }

  changeColor(ThemeColor newColor){
    _themeColor = newColor;
    notifyListeners();
  }
}
