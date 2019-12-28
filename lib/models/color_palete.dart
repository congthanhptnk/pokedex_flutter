import 'package:flutter/material.dart';

class ColorPalete {
  final Color primary;
  final Color secondary;
  final Color background;

  ColorPalete({this.primary, this.secondary, this.background});
}

Map<String, ColorPalete> typeColor = {
  'electric': ColorPalete(
    primary: Color.fromARGB(255, 255, 209, 73),
    secondary: Color.fromARGB(255, 255, 214, 0),
    background: Color.fromARGB(255, 255, 160, 0),
  ),
  'grass': ColorPalete(
    primary: Color.fromARGB(255, 128, 226, 126),
    secondary: Color.fromARGB(255, 111, 191, 114),
    background: Color.fromARGB(255, 88, 152, 91),
  ),
  'fire': ColorPalete(
    primary: Color.fromARGB(255, 247, 143, 110),
    secondary: Color.fromARGB(255, 246, 115, 74),
    background: Color.fromARGB(255, 198, 113, 0),
  )
};
