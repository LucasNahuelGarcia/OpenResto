import 'package:flutter/material.dart';
import 'partes/estilo.dart' as estilos;
import 'vistas/vistaLogIn.dart';
import 'vistas/vistaMain.dart';
import 'vistas/vistaRegistrarseUserMail.dart';
import 'vistas/vistaRegistrarsePass.dart';
import 'datosGlobales.dart' as datos;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("iniciando");
    return MaterialApp(
      title: "OpenResto",
      routes: <String, WidgetBuilder>{
        "VistaLogIn": (BuildContext context) => new VistaLogIn(),
        "VistaMain": (BuildContext context) => new VistaMain(),
        "VistaRegistrarseUserMail" : (BuildContext context) => new VistaRegistrarseUserMail(),
        "VistaRegistrarsePass" : (BuildContext context) => new VistaRegistrarsePass(),
      },
      theme: estilos.temaDefault,
      home: datos.usuario != null ? VistaMain() : VistaLogIn(),
    );
  }
}
