import 'dart:ui';
import 'package:flutter/material.dart';

class ColorPalette {
  static const Color white = const Color(0xffffffff);
  static const Color errorRed = const Color(0xffe63946);
  static const Color darkPurple = const Color(0xff704593);
  static const Color lightPurple = const Color(0xff8855b4);
  static const Color superlightPurple = const Color(0xfff3edf7);
  static const Color cream = const Color(0xfff1faee);
}

Map<int, Color> color = {
  50: Color.fromRGBO(112, 69, 147, .1),
  100: Color.fromRGBO(112, 69, 147, .2),
  200: Color.fromRGBO(112, 69, 147, .3),
  300: Color.fromRGBO(112, 69, 147, .4),
  400: Color.fromRGBO(112, 69, 147, .5),
  500: Color.fromRGBO(112, 69, 147, .6),
  600: Color.fromRGBO(112, 69, 147, .7),
  700: Color.fromRGBO(112, 69, 147, .8),
  800: Color.fromRGBO(112, 69, 147, .9),
  900: Color.fromRGBO(112, 69, 147, 1),
};

MaterialColor customSwatch = MaterialColor(0xFF704593, color);
