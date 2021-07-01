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

  static Color colorOf(ThemeColor colorIN, bool darkMode) {
    if (!darkMode) {
      switch (colorIN) {
        case ThemeColor.brown:  return Colors.brown.shade300;
        case ThemeColor.yellow: return Colors.amber.shade400;
        case ThemeColor.orange: return Colors.orange.shade400;
        case ThemeColor.red:    return Colors.red.shade400;
        case ThemeColor.pink:   return Colors.pink.shade300;
        case ThemeColor.violet: return Colors.purple.shade300;
        case ThemeColor.purple: return Colors.deepPurple.shade300;
        case ThemeColor.indigo: return Colors.indigo.shade300;
        case ThemeColor.blue:   return Colors.blue.shade400;
        case ThemeColor.cyan:   return Colors.cyan.shade500;
        case ThemeColor.green:  return Colors.lightGreen.shade500;
        case ThemeColor.lime:   return Colors.lime.shade500;
      }
    }
    else {
      switch (colorIN) {
        case ThemeColor.brown:  return Colors.brown.shade600;
        case ThemeColor.yellow: return Colors.amber.shade800;
        case ThemeColor.orange: return Colors.orange.shade800;
        case ThemeColor.red:    return Colors.red.shade800;
        case ThemeColor.pink:   return Colors.pink.shade700;
        case ThemeColor.violet: return Colors.purple.shade600;
        case ThemeColor.purple: return Colors.deepPurple.shade500;
        case ThemeColor.indigo: return Colors.indigo.shade500;
        case ThemeColor.blue:   return Colors.blue.shade700;
        case ThemeColor.cyan:   return Colors.cyan.shade700;
        case ThemeColor.green:  return Colors.lightGreen.shade700;
        case ThemeColor.lime:   return Colors.lime.shade700;
      }
    }
  }
}
