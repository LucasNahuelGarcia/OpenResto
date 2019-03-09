import 'package:flutter/material.dart';
import 'colores.dart' as colores;


class TituloApp extends StatelessWidget {
  final fontSize;

  TituloApp(this.fontSize);

  Widget build(BuildContext context) {
    return Text(
      "VeganEssen",
      style: TextStyle(
          fontFamily: "Oleo", fontSize: fontSize, color: colores.verdeTitulo),
    );
  }
}


ThemeData temaDefault = ThemeData(
  textSelectionColor: Colors.blue,
  indicatorColor: colores.principal,
  highlightColor: Colors.white,

  primaryColor: colores.principal,

  backgroundColor: colores.verdeFondo,
  cursorColor: colores.principal,
  inputDecorationTheme: InputDecorationTheme(
    hasFloatingPlaceholder: true,
    border: OutlineInputBorder(),
    fillColor: colores.verdeTituloTransparente,
    filled: true,
    hintStyle: TextStyle(color: Colors.grey),
  ),
  scaffoldBackgroundColor: colores.verdeFondo,
  buttonColor: colores.principal
);