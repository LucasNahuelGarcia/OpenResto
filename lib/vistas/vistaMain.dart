import 'package:flutter/material.dart';
import '../partes/mapa.dart';
import '../partes/lista.dart';


class VistaMain extends StatelessWidget {
  int navBarActiveItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MainPagina"),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navBarActiveItem,
        iconSize: 30.0,
        onTap: (item) {
          navBarActiveItem =item;
        },
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(title: Text("Mapa"), icon: Icon(Icons.map)),
          BottomNavigationBarItem( title: Text("Lista cercanos"), icon: Icon(Icons.list)),
        ],
      ),
      body: MapaRest(),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("lala"),
              accountName: Text("NombreLaLa"),
            )
          ],
        ),
      ),
    );
  }
}
