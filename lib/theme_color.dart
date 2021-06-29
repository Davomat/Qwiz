import 'package:flutter/material.dart';

enum ThemeColor {
  brown,
  yellow,
  orange,
  red,
  pink,
  violet,
  purple,
  indigo,
  blue,
  cyan,
  green,
  lime,
}

class ColorHandler {
  static final myBrownLight  = Colors.brown.shade200;
  static final myYellowLight = Colors.yellow.shade600;
  static final myAmberLight  = Colors.amber.shade500;
  static final myOrangeLight = Colors.orange.shade500;
  static final myRedLight    = Color.fromARGB(0xff, 0xff, 0x6f, 0x6f);
  static final myPinkLight   = Color.fromARGB(0xff, 0xf8, 0x73, 0xa0);
  static final myVioletLight = Colors.purple.shade200;
  static final myPurpleLight = Colors.deepPurple.shade200;
  static final myIndigoLight = Colors.indigo.shade200;
  static final myBlueLight   = Colors.lightBlue.shade400;
  static final myCyanLight   = Colors.cyan.shade400;
  static final myGreenLight  = Colors.lightGreen.shade500;
  static final myLimeLight   = Colors.lime.shade500;

  static final myBrownDark   = Color.fromARGB(0xff, 0x6d, 0x4c, 0x41); // brown.shade600;
  static final myYellowDark  = Color.fromARGB(0xff, 0xbc, 0x87, 0x05);
  static final myOrangeDark  = Color.fromARGB(0xff, 0xe6, 0x51, 0x00); // orange.shade900;
  static final myRedDark     = Color.fromARGB(0xff, 0xc6, 0x28, 0x28); // red.shade800;
  static final myPinkDark    = Color.fromARGB(0xff, 0xad, 0x14, 0x57); // pink.shade800;
  static final myVioletDark  = Color.fromARGB(0xff, 0x7b, 0x1f, 0xa2); // purple.shade700;
  static final myPurpleDark  = Color.fromARGB(0xff, 0x5e, 0x35, 0xb1); // deepPurple.shade600;
  static final myIndigoDark  = Color.fromARGB(0xff, 0x39, 0x49, 0xab); // indigo.shade600;
  static final myBlueDark    = Color.fromARGB(0xff, 0x15, 0x65, 0xc0); // blue.shade800;
  static final myCyanDark    = Color.fromARGB(0xff, 0x00, 0x83, 0x8f); // cyan.shade800;
  static final myGreenDark   = Color.fromARGB(0xff, 0x55, 0x8b, 0x2f); // lightGreen.shade800;
  static final myLimeDark    = Color.fromARGB(0xff, 0x82, 0x77, 0x17); // lime.shade900;

  static List<ThemeColor> getAllThemeColors() {
    return <ThemeColor>[
      ThemeColor.yellow,
      ThemeColor.orange,
      ThemeColor.red,
      ThemeColor.pink,
      ThemeColor.brown,
      ThemeColor.violet,
      ThemeColor.purple,
      ThemeColor.indigo,
      ThemeColor.blue,
      ThemeColor.cyan,
      ThemeColor.green,
      ThemeColor.lime,
    ];
  }

  static String stringOf(ThemeColor colorIN) {
    switch (colorIN) {
      case ThemeColor.brown:  return 'Braun';
      case ThemeColor.yellow: return 'Gold';
      case ThemeColor.orange: return 'Orange';
      case ThemeColor.red:    return 'Rot';
      case ThemeColor.pink:   return 'Pink';
      case ThemeColor.violet: return 'Lila';
      case ThemeColor.purple: return 'Violett';
      case ThemeColor.indigo: return 'Indigo';
      case ThemeColor.blue:   return 'Blau';
      case ThemeColor.cyan:   return 'Cyan';
      case ThemeColor.green:  return 'Grün';
      case ThemeColor.lime:   return 'Lime';
      default:                return '';
    }
  }

  static MaterialColor colorOf(ThemeColor colorIN, bool darkMode) {
    if (!darkMode) {
      switch (colorIN) {
        case ThemeColor.brown:  return getMaterialColor(myBrownLight);
        case ThemeColor.yellow: return getMaterialColor(myYellowLight);
        case ThemeColor.orange: return getMaterialColor(myOrangeLight);
        case ThemeColor.red:    return getMaterialColor(myRedLight);
        case ThemeColor.pink:   return getMaterialColor(myPinkLight);
        case ThemeColor.violet: return getMaterialColor(myVioletLight);
        case ThemeColor.purple: return getMaterialColor(myPurpleLight);
        case ThemeColor.indigo: return getMaterialColor(myIndigoLight);
        case ThemeColor.blue:   return getMaterialColor(myBlueLight);
        case ThemeColor.cyan:   return getMaterialColor(myCyanLight);
        case ThemeColor.green:  return getMaterialColor(myGreenLight);
        case ThemeColor.lime:   return getMaterialColor(myLimeLight);
      }
    }
    else {
      switch (colorIN) {
        case ThemeColor.brown:  return getMaterialColor(myBrownDark);
        case ThemeColor.yellow: return getMaterialColor(myYellowDark);
        case ThemeColor.orange: return getMaterialColor(myOrangeDark);
        case ThemeColor.red:    return getMaterialColor(myRedDark);
        case ThemeColor.pink:   return getMaterialColor(myPinkDark);
        case ThemeColor.violet: return getMaterialColor(myVioletDark);
        case ThemeColor.purple: return getMaterialColor(myPurpleDark);
        case ThemeColor.indigo: return getMaterialColor(myIndigoDark);
        case ThemeColor.blue:   return getMaterialColor(myBlueDark);
        case ThemeColor.cyan:   return getMaterialColor(myCyanDark);
        case ThemeColor.green:  return getMaterialColor(myGreenDark);
        case ThemeColor.lime:   return getMaterialColor(myLimeDark);
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
