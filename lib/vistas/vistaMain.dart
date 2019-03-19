import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../partes/mapa.dart';
import '../partes/lista.dart';
import '../partes/widgetCorredizo.dart';
import '../datosGlobales.dart' as datos;

class VistaMain extends StatelessWidget {
  final widgetCorredizo = WidgetCorredizo(
    MapaRest(),
    ListaRest(),
  );

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
