import 'package:control_ganado/src/pages/animales.dart';
import 'package:control_ganado/src/pages/datos.dart';
import 'package:control_ganado/src/pages/home_page.dart';
import 'package:flutter/material.dart';

Map <String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
    '/'        : (BuildContext context) => HomePage(),
    'animales' : (BuildContext context) => AnimalesPage(),
    'datos'    : (BuildContext context) => DataPage(),
  };

}