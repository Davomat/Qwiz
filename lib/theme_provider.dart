import 'package:flutter/material.dart';


class FadeTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(_, __, animation, ___, child) => FadeTransition(opacity: animation, child: child);
}

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.lightGreen,
  accentColor: Colors.lightGreenAccent,
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.iOS: FadeTransitionBuilder(),
    TargetPlatform.android: FadeTransitionBuilder(),
  }),
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  accentColor: Colors.indigoAccent,
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.iOS: FadeTransitionBuilder(),
    TargetPlatform.android: FadeTransitionBuilder(),
  }),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  bool _darkTheme = false;

  ThemeNotifier();

  bool get darkTheme => _darkTheme;

  toggleTheme(){
    _darkTheme = !_darkTheme;
    notifyListeners();
  }
}
