import 'package:flutter/material.dart';

import 'theme_color.dart';


class ThemeNotifier extends ChangeNotifier {
  final key = "theme";
  bool _darkTheme = false;
  ThemeColor _themeColor = ThemeColor.green;

  ThemeNotifier();

  bool get darkTheme => _darkTheme;
  ThemeColor get themeColor => _themeColor;

  bool toggleTheme(){
    _darkTheme = !_darkTheme;
    notifyListeners();
    return _darkTheme;
  }

  ThemeColor changeColor(ThemeColor newColor){
    _themeColor = newColor;
    notifyListeners();
    return _themeColor;
  }
}
