import 'package:flutter/material.dart';

enum ThemeColor {
  amber,
  blue,
  brown,
  cyan,
  green,
  indigo,
  lime,
  orange,
  pink,
  purple,
  red,
  teal,
  violet,
  yellow,
}

class ColorHandler {
  static List<ThemeColor> getAllColors() {
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
      case ThemeColor.amber:  return 'Bernstein';
      case ThemeColor.blue:   return 'Blau';
      case ThemeColor.brown:  return 'Braun';
      case ThemeColor.cyan:   return 'Cyan';
      case ThemeColor.green:  return 'Grün';
      case ThemeColor.indigo: return 'Indigo';
      case ThemeColor.lime:   return 'Lime';
      case ThemeColor.orange: return 'Orange';
      case ThemeColor.pink:   return 'Pink';
      case ThemeColor.purple: return 'Violett';
      case ThemeColor.red:    return 'Rot';
      case ThemeColor.teal:   return 'Türkis';
      case ThemeColor.violet: return 'Lila';
      case ThemeColor.yellow: return 'Gelb';
      default:                return '';
    }
  }

  static Color colorOf(ThemeColor colorIN) {
    switch (colorIN) {
      case ThemeColor.amber:  return Colors.amber;
      case ThemeColor.blue:   return Colors.lightBlue;
      case ThemeColor.brown:  return Colors.brown;
      case ThemeColor.cyan:   return Colors.cyan;
      case ThemeColor.green:  return Colors.lightGreen;
      case ThemeColor.indigo: return Colors.indigo;
      case ThemeColor.lime:   return Colors.lime;
      case ThemeColor.orange: return Colors.orange;
      case ThemeColor.pink:   return Colors.pink;
      case ThemeColor.purple: return Colors.deepPurple;
      case ThemeColor.red:    return Colors.red;
      case ThemeColor.teal:   return Colors.teal;
      case ThemeColor.violet: return Colors.purple;
      case ThemeColor.yellow: return Colors.yellow;
      default:                return Colors.orange;
    }
  }

  static MaterialColor materialColorOf(ThemeColor colorIN) {
    switch (colorIN) {
      case ThemeColor.amber:  return Colors.amber;
      case ThemeColor.blue:   return Colors.lightBlue;
      case ThemeColor.brown:  return Colors.brown;
      case ThemeColor.cyan:   return Colors.cyan;
      case ThemeColor.green:  return Colors.lightGreen;
      case ThemeColor.indigo: return Colors.indigo;
      case ThemeColor.lime:   return Colors.lime;
      case ThemeColor.orange: return Colors.orange;
      case ThemeColor.pink:   return Colors.pink;
      case ThemeColor.purple: return Colors.deepPurple;
      case ThemeColor.red:    return Colors.red;
      case ThemeColor.teal:   return Colors.teal;
      case ThemeColor.violet: return Colors.purple;
      case ThemeColor.yellow: return Colors.yellow;
      default:                return Colors.grey;
    }
  }
}
