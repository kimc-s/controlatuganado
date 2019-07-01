import 'package:control_ganado/src/pages/animales.dart';
import 'package:control_ganado/src/pages/datos_1.dart';
import 'package:control_ganado/src/pages/datos_2.dart';
import 'package:control_ganado/src/pages/datos_3.dart';
import 'package:control_ganado/src/pages/home_page.dart';
import 'package:flutter/material.dart';

Map <String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
    '/'        : (BuildContext context) => HomePage(),
    'animales' : (BuildContext context) => AnimalesPage(),
    'datos1'   : (BuildContext context) => DataPage1(),
    'datos2'   : (BuildContext context) => DataPage2(),
    'datos3'   : (BuildContext context) => DataPage3(),
  };

}