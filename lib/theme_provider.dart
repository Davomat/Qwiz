import 'package:flutter/material.dart';

import 'theme_color.dart';


class ThemeNotifier extends ChangeNotifier {
  final key = "theme";
  bool _darkTheme = false;
  ThemeColor _themeColor = ThemeColor.green;

  ThemeNotifier();

  bool get darkTheme => _darkTheme;

  toggleTheme(){
    _darkTheme = !_darkTheme;
    notifyListeners();
  }
}
