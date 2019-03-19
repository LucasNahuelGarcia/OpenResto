import 'package:flutter/material.dart';
import 'dart:math';

class WidgetCorredizo extends StatefulWidget {
  final Widget vista1;
  final Widget vista2;

  WidgetCorredizoState widgetCorredizoState;

  WidgetCorredizo(this.vista1, this.vista2);

  @override
  State<StatefulWidget> createState() {
    return widgetCorredizoState = WidgetCorredizoState(vista1, vista2);
  }

  void cambiarPagina(int pagina, Duration duracion, Curve curva) {
    widgetCorredizoState.cambiarPagina(pagina,duracion, curva); 
  }
}

class WidgetCorredizoState extends State<WidgetCorredizo> {
  final Widget vista1;
  final Widget vista2;

  PageView _pageView;
  

  WidgetCorredizoState(this.vista1, this.vista2);

  @override
  Widget build(BuildContext context) {
    return _pageView = PageView(
      onPageChanged: (item){
      },
      controller: PageController(),
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        vista1,
        vista2,
      ],
    );
  }

  //Funciones ------------------
  void cambiarPagina(int pagina, Duration duracion, Curve curva) {
    _pageView.controller.animateToPage(pagina,duration: duracion,curve: curva);
  }
}
