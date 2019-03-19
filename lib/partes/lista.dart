import 'package:flutter/material.dart';
import 'botonFlotanteMain.dart';

class ListaRest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListaRestState();
  }
}

class ListaRestState extends State<ListaRest> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: 20,
          itemBuilder: (context, i) {
            return ListTile(
              enabled: true,
              dense: true,
              title: Text("lala"),
            );
          },
        ),

        FloatingLabelMain(alignment: Alignment.bottomLeft,iconData: Icons.map,)
      ],
    );
  }
}
