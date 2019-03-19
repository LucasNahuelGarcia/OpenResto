import 'package:flutter/material.dart';
import '../partes/estilo.dart' as estilo;
import '../partes/form.dart' as forms;

class VistaRegistrarseUserMail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 100.0),
          ),
          estilo.TituloRegistrarse(50.0),
          forms.FormRegistrarseUserMail(),
        ],
      ),
    );
  }
}
