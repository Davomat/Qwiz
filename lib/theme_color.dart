import 'package:flutter/material.dart';

enum ThemeColor {
  brown,
  violet,
  purple,
  indigo,
  blue,
  cyan,
  teal,
  green,
  lime,
  yellow,
  amber,
  orange,
  red,
  pink,
}

class ColorHandler {
  static final myBrownLight  = Colors.brown.shade200;
  static final myVioletLight = Colors.purple.shade200;
  static final myPurpleLight = Colors.deepPurple.shade200;
  static final myIndigoLight = Colors.indigo.shade200;
  static final myBlueLight   = Colors.lightBlue.shade400;
  static final myCyanLight   = Colors.cyan.shade400;
  static final myTealLight   = Colors.teal.shade300;
  static final myGreenLight  = Colors.lightGreen.shade500;
  static final myLimeLight   = Colors.lime.shade500;
  static final myYellowLight = Colors.yellow.shade600;
  static final myAmberLight  = Colors.amber.shade500;
  static final myOrangeLight = Colors.orange.shade400;
  static final myRedLight    = Color.fromARGB(0xff, 0xff, 0x6f, 0x6f);
  static final myPinkLight   = Color.fromARGB(0xff, 0xf8, 0x73, 0xa0);

  static final myBrownDark   = Colors.brown.shade600;
  static final myVioletDark  = Colors.purple.shade600;
  static final myPurpleDark  = Colors.deepPurple.shade600;
  static final myIndigoDark  = Colors.indigo.shade600;
  static final myBlueDark    = Colors.lightBlue.shade800;
  static final myCyanDark    = Colors.cyan.shade800;
  static final myTealDark    = Colors.teal.shade700;
  static final myGreenDark   = Colors.lightGreen.shade900;
  static final myLimeDark    = Colors.lime.shade900;
  static final myYellowDark  = Color.fromARGB(0xff, 0xa8, 0x90, 0x00);
  static final myAmberDark   = Color.fromARGB(0xff, 0xc1, 0x8d, 0x00);
  static final myOrangeDark  = Colors.orange.shade800;
  static final myRedDark     = Colors.red.shade600;
  static final myPinkDark    = Colors.pink.shade600;

  static List<ThemeColor> getAllThemeColors() {
    return <ThemeColor>[
      ThemeColor.brown,
      ThemeColor.violet,
      ThemeColor.purple,
      ThemeColor.indigo,
      ThemeColor.blue,
      ThemeColor.cyan,
      ThemeColor.teal,
      ThemeColor.green,
      ThemeColor.lime,
      ThemeColor.yellow,
      ThemeColor.amber,
      ThemeColor.orange,
      ThemeColor.red,
      ThemeColor.pink,
    ];
  }

  static String stringOf(ThemeColor colorIN) {
    switch (colorIN) {
      case ThemeColor.brown:  return 'Braun';
      case ThemeColor.violet: return 'Lila';
      case ThemeColor.purple: return 'Violett';
      case ThemeColor.indigo: return 'Indigo';
      case ThemeColor.blue:   return 'Blau';
      case ThemeColor.cyan:   return 'Cyan';
      case ThemeColor.teal:   return 'Türkis';
      case ThemeColor.green:  return 'Grün';
      case ThemeColor.lime:   return 'Lime';
      case ThemeColor.yellow: return 'Gelb';
      case ThemeColor.amber:  return 'Bernstein';
      case ThemeColor.orange: return 'Orange';
      case ThemeColor.red:    return 'Rot';
      case ThemeColor.pink:   return 'Pink';
      default:                return '';
    }
  }

  static MaterialColor colorOf(ThemeColor colorIN, bool darkMode) {
    if (!darkMode) {
      switch (colorIN) {
        case ThemeColor.brown:  return getMaterialColor(myBrownLight);
        case ThemeColor.violet: return getMaterialColor(myVioletLight);
        case ThemeColor.purple: return getMaterialColor(myPurpleLight);
        case ThemeColor.indigo: return getMaterialColor(myIndigoLight);
        case ThemeColor.blue:   return getMaterialColor(myBlueLight);
        case ThemeColor.cyan:   return getMaterialColor(myCyanLight);
        case ThemeColor.teal:   return getMaterialColor(myTealLight);
        case ThemeColor.green:  return getMaterialColor(myGreenLight);
        case ThemeColor.lime:   return getMaterialColor(myLimeLight);
        case ThemeColor.yellow: return getMaterialColor(myYellowLight);
        case ThemeColor.amber:  return getMaterialColor(myAmberLight);
        case ThemeColor.orange: return getMaterialColor(myOrangeLight);
        case ThemeColor.red:    return getMaterialColor(myRedLight);
        case ThemeColor.pink:   return getMaterialColor(myPinkLight);
      }
    }
    else {
      switch (colorIN) {
        case ThemeColor.brown:  return getMaterialColor(myBrownDark);
        case ThemeColor.violet: return getMaterialColor(myVioletDark);
        case ThemeColor.purple: return getMaterialColor(myPurpleDark);
        case ThemeColor.indigo: return getMaterialColor(myIndigoDark);
        case ThemeColor.blue:   return getMaterialColor(myBlueDark);
        case ThemeColor.cyan:   return getMaterialColor(myCyanDark);
        case ThemeColor.teal:   return getMaterialColor(myTealDark);
        case ThemeColor.green:  return getMaterialColor(myGreenDark);
        case ThemeColor.lime:   return getMaterialColor(myLimeDark);
        case ThemeColor.yellow: return getMaterialColor(myYellowDark);
        case ThemeColor.amber:  return getMaterialColor(myAmberDark);
        case ThemeColor.orange: return getMaterialColor(myOrangeDark);
        case ThemeColor.red:    return getMaterialColor(myRedDark);
        case ThemeColor.pink:   return getMaterialColor(myPinkDark);
      }
    }
  }

  static MaterialColor getMaterialColor(Color color) {
    return MaterialColor(_getIntFromColor(color), _getMapFromColor(color));
  }

  static int _getIntFromColor(Color color) {
    return 256*256*256*255 + 256*256*color.red + 256*color.green + color.blue;
  }

  static Map<int, Color> _getMapFromColor (Color color){
    return {
      50: color,
      100: color,
      200: color,
      300: color,
      400: color,
      500: color,
      600: color,
      700: color,
      800: color,
      900: color,
    };
  }
}
