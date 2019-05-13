import 'package:flutter/material.dart';
import '../../datosGlobales.dart' as datos;
import '../../funciones/userAuth.dart' as _auth;
//import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'contenedorSlider.dart';

class VistaMain extends StatelessWidget {
  final widgetCorredizo = WidgetCorredizo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MainPagina"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(datos.usuario.email ?? ""),
              accountName: Text(datos.usuario.displayName ?? ""),
            ),
            FlatButton(
              child: Text("Cerrar Sesión"),
              onPressed: () {
                print("Cerrar sesion");
                _auth.cerrarSesion();
                Navigator.pushReplacementNamed(context, 'VistaLogIn');
              },
            )
          ],
        ),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(child: widgetCorredizo),
        ],
      ),
    );
  }
}
