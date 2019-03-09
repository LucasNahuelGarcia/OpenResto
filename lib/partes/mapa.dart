import 'package:flutter/material.dart';

class MapaRest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MapaRestState();
  }
}

class MapaRestState extends State<MapaRest> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Icon(Icons.map,size: 200.0, color: Colors.white,),);
  }
}