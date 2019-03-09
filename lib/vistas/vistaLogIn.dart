import 'package:flutter/material.dart';
import '../partes/estilo.dart' as estilos;
import '../partes/form.dart' as forms;

class VistaLogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 50.0),
                ),
                estilos.TituloApp(70.0), //Titulo
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: forms.FormLogIn(), //Formulario
                ),
              ],
            ),
          ),
        ));
  }
}
