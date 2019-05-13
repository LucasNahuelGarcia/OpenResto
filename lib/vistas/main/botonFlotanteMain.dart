import 'package:flutter/material.dart';

class FloatingLabelMain extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;
  final Alignment alignment;
  final double iconSize;
  const FloatingLabelMain({
    this.iconData,
    this.alignment,
    this.iconSize: 45.0,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    double sideL, sideR;

    if ((alignment == Alignment.bottomRight) ||
        (alignment == Alignment.centerRight) ||
        (alignment == Alignment.topRight)) {
      //alineado a la izquierda
      sideL = 5.0;
      sideR = 0.0;
    } else if ((alignment == Alignment.bottomLeft) ||
        (alignment == Alignment.centerLeft) ||
        (alignment == Alignment.topLeft)) {
      //alineado a la derecha
      sideL = 0.0;
      sideR = 5.0;
    } else {
      //alineado en el centro
      sideL = 5.0;
      sideR = 5.0;
    }
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.only(bottom: 50.0),
        child: RaisedButton(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(sideL),
              right: Radius.circular(sideR),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 5.0),
          onPressed: this.onPressed,
          child: Icon(iconData, size: iconSize, color: Colors.white30),
        ),
      ),
    );
  }
}
