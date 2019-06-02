import 'package:flutter/material.dart';
import 'colores.dart' as colores;

class TituloApp extends StatelessWidget {
  final fontSize;

  TituloApp(this.fontSize);

  Widget build(BuildContext context) {
    return Text(
      "OpenResto",
      style: TextStyle(
        fontFamily: "JustAnotherHand",
        fontSize: fontSize,
      ),
    );
  }
}

ThemeData temaDefault = ThemeData(
  primaryColor: colores.verdeClaro,
  buttonColor: colores.verdeClaro,
  appBarTheme: AppBarTheme(
      color: Colors.white,
      textTheme: TextTheme(
        title: TextStyle(
          color: colores.textoGris,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300,
          fontSize: 41,
          fontStyle: FontStyle.italic,
        ),
      )),
  inputDecorationTheme: InputDecorationTheme(
    hasFloatingPlaceholder: true,
    hintStyle: TextStyle(color: colores.textoGris),
  ),
  textTheme: TextTheme(
      body1: TextStyle(
          color: colores.textoGris,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w300),
      button: TextStyle(
          color: colores.verdeOscuro,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500)),
);
