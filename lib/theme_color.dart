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
  static final myBrownLight  = Color.fromARGB(0xff, 0xae, 0x99, 0x91);
  static final myYellowLight = Color.fromARGB(0xff, 0xff, 0xca, 0x28); // Colors.amber.shade300;
  static final myOrangeLight = Color.fromARGB(0xff, 0xff, 0xa7, 0x26); // Colors.orange.shade400;
  static final myRedLight    = Color.fromARGB(0xff, 0xff, 0x7a, 0x7a);
  static final myPinkLight   = Color.fromARGB(0xff, 0xf0, 0x70, 0xba);
  static final myVioletLight = Color.fromARGB(0xff, 0xda, 0x83, 0xec);
  static final myPurpleLight = Color.fromARGB(0xff, 0xb3, 0x8d, 0xec);
  static final myIndigoLight = Color.fromARGB(0xff, 0x9f, 0xa8, 0xda); // Colors.indigo.shade200;
  static final myBlueLight   = Color.fromARGB(0xff, 0x64, 0xb5, 0xf6); // Colors.blue.shade300;
  static final myCyanLight   = Color.fromARGB(0xff, 0x26, 0xc6, 0xda); // Colors.cyan.shade400;
  static final myGreenLight  = Color.fromARGB(0xff, 0x9c, 0xcc, 0x65); // Colors.lightGreen.shade400;
  static final myLimeLight   = Color.fromARGB(0xff, 0xd4, 0xe1, 0x57); // Colors.lime.shade400;

  static final myBrownDark   = Color.fromARGB(0xff, 0x6d, 0x4c, 0x41); // Colors.brown.shade600;
  static final myYellowDark  = Color.fromARGB(0xff, 0xbc, 0x87, 0x05);
  static final myOrangeDark  = Color.fromARGB(0xff, 0xe6, 0x51, 0x00); // Colors.orange.shade900;
  static final myRedDark     = Color.fromARGB(0xff, 0xc6, 0x28, 0x28); // Colors.red.shade800;
  static final myPinkDark    = Color.fromARGB(0xff, 0xad, 0x14, 0x57); // Colors.pink.shade800;
  static final myVioletDark  = Color.fromARGB(0xff, 0x7b, 0x1f, 0xa2); // Colors.purple.shade700;
  static final myPurpleDark  = Color.fromARGB(0xff, 0x5e, 0x35, 0xb1); // Colors.deepPurple.shade600;
  static final myIndigoDark  = Color.fromARGB(0xff, 0x39, 0x49, 0xab); // Colors.indigo.shade600;
  static final myBlueDark    = Color.fromARGB(0xff, 0x15, 0x65, 0xc0); // Colors.blue.shade800;
  static final myCyanDark    = Color.fromARGB(0xff, 0x00, 0x83, 0x8f); // Colors.cyan.shade800;
  static final myGreenDark   = Color.fromARGB(0xff, 0x55, 0x8b, 0x2f); // Colors.lightGreen.shade800;
  static final myLimeDark    = Color.fromARGB(0xff, 0x82, 0x77, 0x17); // Colors.lime.shade900;

  static List<ThemeColor> getAllThemeColors() {
    return <ThemeColor>[
      ThemeColor.brown,
      ThemeColor.yellow,
      ThemeColor.orange,
      ThemeColor.red,
      ThemeColor.pink,
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
      case ThemeColor.yellow: return 'Gelb';
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
