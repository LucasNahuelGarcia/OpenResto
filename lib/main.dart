import 'package:flutter/material.dart';
import 'partes/estilo.dart' as estilos;
import 'vistas/vistaLogIn.dart';
import 'vistas/vistaMain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VeganEssen",
      routes: <String, WidgetBuilder> {
        "VistaLogIn" : (BuildContext context) => new VistaLogIn(),
        "VistaMain" : (BuildContext context) => new VistaMain()
      },
      theme: estilos.temaDefault,
      home: VistaLogIn()
    );
  }
}
