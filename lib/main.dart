import 'package:flutter/material.dart';
import 'partes/estilo.dart' as estilos;
import 'vistas/login/index.dart';
import 'vistas/main/vistaMain.dart';
import 'vistas/registrarse/index.dart';
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
      },
      theme: estilos.temaDefault,
      home: datos.usuario != null ? VistaMain() : VistaLogIn(),
    );
  }
}
