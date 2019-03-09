import 'package:flutter/material.dart';

class MensajeError extends StatefulWidget {
  final MensajeErrorState state = MensajeErrorState();
  @override
  State<StatefulWidget> createState() {
    return state;
  }
}

class MensajeErrorState extends State<MensajeError> {
  bool ver = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: ver,
      child: Card(
        child: Center(
          heightFactor: 2.0,
          child: Text(
            "Error",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        color: Colors.red,
      ),
    );
  }

  ///Funciones ------------
  void toggleVer(bool val) {
    setState(() {
      ver = val;
    });
  }
}