import 'package:flutter/material.dart';

class ListaRest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListaRestState();
  }
}

class ListaRestState extends State<ListaRest> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Icon(Icons.list,size: 200.0, color: Colors.white,),);
  }
}