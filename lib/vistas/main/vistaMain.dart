import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'mapa.dart';
import 'lista.dart';
import 'mainGlobal.dart' as _mainGlobal;
import '../../datosGlobales.dart' as datos;
import '../../funciones/userAuth.dart' as _auth;
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class VistaMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[Container()],
        title: Text("Mapa"),
      ),
      endDrawer: FractionallySizedBox(
        widthFactor: 1,
        child: Drawer(
          child: ListaRest(),
        ),
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
      body: MapaRest(),
    );
  }
}
