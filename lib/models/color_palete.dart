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
  'normal': ColorPalete(
    primary: Color.fromARGB(255, 197, 198, 167),
    secondary: Color.fromARGB(255, 177, 178, 150),
    background: Color.fromARGB(255, 141, 142, 120),
  ),
  'ghost': ColorPalete(
    primary: Color.fromARGB(255, 162, 146, 188),
    secondary: Color.fromARGB(255, 129, 116, 150),
    background: Color.fromARGB(255, 112, 88, 152),
  ),
  'water': ColorPalete(
    primary: Color.fromARGB(255, 24, 191, 255),
    secondary: Color.fromARGB(255, 63, 157, 193),
    background: Color.fromARGB(255, 16, 133, 178),
  ),
  'fire': ColorPalete(
    primary: Color.fromARGB(255, 247, 143, 110),
    secondary: Color.fromARGB(255, 246, 115, 74),
    background: Color.fromARGB(255, 198, 113, 0),
  ),
  'steel': ColorPalete(
    primary: Color.fromARGB(255, 247, 143, 110),
    secondary: Color.fromARGB(255, 246, 115, 74),
    background: Color.fromARGB(255, 198, 113, 0),
  ),
  'fairy': ColorPalete(
    primary: Color.fromARGB(255, 244, 189, 201),
    secondary: Color.fromARGB(255, 219, 170, 180),
    background: Color.fromARGB(255, 238, 153, 172),
  ),
  'dragon': ColorPalete(
    primary: Color.fromARGB(255, 162, 125, 250),
    secondary: Color.fromARGB(255, 129, 100, 200),
    background: Color.fromARGB(255, 112, 56, 248),
  ),
  'poison': ColorPalete(
    primary: Color.fromARGB(255, 193, 131, 193),
    secondary: Color.fromARGB(255, 173, 117, 173),
    background: Color.fromARGB(255, 155, 105, 155),
  ),
  'rock': ColorPalete(
    primary: Color.fromARGB(255, 209, 193, 125),
    secondary: Color.fromARGB(255, 167, 154, 100),
    background: Color.fromARGB(255, 184, 160, 56),
  ),
  'ground': ColorPalete(
    primary: Color.fromARGB(255, 247, 143, 110),
    secondary: Color.fromARGB(255, 246, 115, 74),
    background: Color.fromARGB(255, 198, 113, 0),
  ),
  'flying': ColorPalete(
    primary: Color.fromARGB(255, 198, 183, 245),
    secondary: Color.fromARGB(255, 178, 164, 220),
    background: Color.fromARGB(255, 160, 147, 198),
  ),
  'dark': ColorPalete(
    primary: Color.fromARGB(255, 162, 146, 136),
    secondary: Color.fromARGB(255, 129, 116, 108),
    background: Color.fromARGB(255, 112, 88, 72),
  ),
  'psychic': ColorPalete(
    primary: Color.fromARGB(255, 250, 146, 178),
    secondary: Color.fromARGB(255, 200, 116, 142),
    background: Color.fromARGB(255, 248, 88, 136),
  ),
  'bug': ColorPalete(
    primary: Color.fromARGB(255, 198, 209, 110),
    secondary: Color.fromARGB(255, 167, 175, 104),
    background: Color.fromARGB(255, 133, 140, 83),
  ),
  'fighting': ColorPalete(
    primary: Color.fromARGB(255, 214, 120, 115),
    secondary: Color.fromARGB(255, 171, 96, 92),
    background: Color.fromARGB(255, 192, 48, 40),
  ),
  'ground': ColorPalete(
    primary: Color.fromARGB(255, 235, 214, 157),
    secondary: Color.fromARGB(255, 188, 171, 125),
    background: Color.fromARGB(255, 224, 192, 104),
  ),
  'ice': ColorPalete(
    primary: Color.fromARGB(255, 188, 230, 230),
    secondary: Color.fromARGB(255, 150, 184, 184),
    background: Color.fromARGB(255, 152, 216, 216),
  ),
};
