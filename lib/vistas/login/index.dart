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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(//Titulo
              padding: EdgeInsets.only(top: 102.0,bottom: 31.0),
              child: estilos.TituloApp(104.0), 
            ),
            Container(//Formulario
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: forms.FormLogIn(), 
            ),
          ],
        ),
      ),
    );
  }
}
