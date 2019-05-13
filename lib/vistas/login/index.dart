import 'package:flutter/material.dart';
import '../../partes/estilo.dart' as estilos;
import 'formLogIn.dart' as forms;
import '../../partes/colores.dart' as colores;

class VistaLogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -1),
            radius: 2,
            colors: [colores.verdeOscuro, Colors.black],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50.0),
            ),
            estilos.TituloApp(75.0), //Titulo
            Container(
              padding: EdgeInsets.all(20.0),
              child: forms.FormLogIn(), //Formulario
            ),
          ],
        ),
      ),
    );
  }
}
