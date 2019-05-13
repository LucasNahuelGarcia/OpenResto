import 'package:flutter/material.dart';
import '../../partes/colores.dart' as colores;
import 'formRegistrarse.dart' as forms;

class VistaRegistrarseUserMail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Titulo
          Container(
            padding: EdgeInsets.only(top: 100.0),
            child: Text(
              "Registrarse",
              style: TextStyle(
                fontFamily: "Oleo",
                fontSize: 50,
                color: colores.verdeClaro,
              ),
            ),
          ),
          forms.FormRegistrarse(),
        ],
      ),
    );
  }
}
