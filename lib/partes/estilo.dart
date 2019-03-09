import 'package:flutter/material.dart';
import 'colores.dart' as colores;

class TituloApp extends StatelessWidget {
  final fontSize;

  TituloApp(this.fontSize);

  Widget build(BuildContext context) {
    return Text(
      "OpenResto",
      style: TextStyle(
        fontFamily: "Oleo",
        fontSize: fontSize,
        color: colores.verdeClaro,
      ),
    );
  }
}

ThemeData temaDefault = ThemeData(
  primaryColor: colores.principal,
  highlightColor: colores.highlight,
  textSelectionColor: Colors.blue,
  indicatorColor: colores.principal,
  backgroundColor: colores.verdeOscuro,
  cursorColor: colores.principal,
  inputDecorationTheme: InputDecorationTheme(
    hasFloatingPlaceholder: true,
    border: OutlineInputBorder(),
    fillColor: Colors.white,
    filled: true,
    hintStyle: TextStyle(color: Colors.grey),
  ),
  scaffoldBackgroundColor: colores.verdeOscuro,
  buttonColor: colores.principal,
);
