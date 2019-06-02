import 'package:flutter/material.dart';
import 'botonFlotanteMain.dart';
import 'mainGlobal.dart' as _mainGlobal;

class MapaRest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MapaRestState();
  }
}

class MapaRestState extends State<MapaRest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Icon(
            Icons.map,
            size: 200.0,
            color: Colors.white,
          ),
          
          //etiqueta flotante
          FloatingLabelMain(
            iconData: Icons.list,
            alignment: Alignment.bottomRight,
            onPressed: () =>   Scaffold.of(context).openEndDrawer(),
          )
        ],
      ),
    );
  }
}
