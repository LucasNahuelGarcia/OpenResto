import 'mainGlobal.dart' as _mainGlobal;     
import 'package:flutter/material.dart';

import 'mapa.dart';
import 'lista.dart';


class WidgetCorredizo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WidgetCorredizoState();
  }
}

class WidgetCorredizoState extends State<WidgetCorredizo> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _mainGlobal.sliderController,
      onPageChanged: (item) {},
      scrollDirection: Axis.horizontal,
      children: <Widget>[
      ],
    );
  }
}
