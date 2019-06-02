import 'package:flutter/widgets.dart';
import '../../clases/restaurant.dart';


PageController sliderController = PageController();

void animarAPagina(int pagina){
  print('animando a pagina $pagina');
  sliderController.animateToPage(pagina, duration: Duration(milliseconds: 205), curve: Curves.easeInCirc);
}