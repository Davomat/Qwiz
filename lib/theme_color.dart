import 'package:flutter/material.dart';

enum ThemeColor {
  amber,
  blue,
  brown,
  green,
  indigo,
  lime,
  orange,
  pink,
  purple,
  red,
  teal,
  yellow,
}

List<ThemeColor> getAllColors() {
  return <ThemeColor>[
    ThemeColor.amber,
    ThemeColor.blue,
    ThemeColor.brown,
    ThemeColor.green,
    ThemeColor.indigo,
    ThemeColor.lime,
    ThemeColor.orange,
    ThemeColor.pink,
    ThemeColor.purple,
    ThemeColor.red,
    ThemeColor.teal,
    ThemeColor.yellow,
  ];
}

String stringOf(ThemeColor colorIN) {
  switch (colorIN) {
    case ThemeColor.amber:  return 'Bernstein';
    case ThemeColor.blue:   return 'Blau';
    case ThemeColor.brown:  return 'Braun';
    case ThemeColor.green:  return 'Grün';
    case ThemeColor.indigo: return 'indigo';
    case ThemeColor.lime:   return 'Lime';
    case ThemeColor.orange: return 'Orange';
    case ThemeColor.pink:   return 'Pink';
    case ThemeColor.purple: return 'Lila';
    case ThemeColor.red:    return 'Rot';
    case ThemeColor.teal:   return 'Türkis';
    case ThemeColor.yellow: return 'Gelb';
    default:                return '';
  }
}

Color colorOf(ThemeColor colorIN) {
  switch (colorIN) {
    case ThemeColor.amber:  return Colors.amber;
    case ThemeColor.blue:   return Colors.lightBlue;
    case ThemeColor.brown:  return Colors.brown;
    case ThemeColor.green:  return Colors.lightGreen;
    case ThemeColor.indigo: return Colors.indigo;
    case ThemeColor.lime:   return Colors.lime;
    case ThemeColor.orange: return Colors.orange;
    case ThemeColor.pink:   return Colors.pink;
    case ThemeColor.purple: return Colors.deepPurple;
    case ThemeColor.red:    return Colors.red;
    case ThemeColor.teal:   return Colors.teal;
    case ThemeColor.yellow: return Colors.yellow;
    default:                return Colors.grey;
  }
}