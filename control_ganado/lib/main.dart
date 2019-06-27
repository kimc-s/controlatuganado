import 'package:control_ganado/src/pages/home_page.dart';
import 'package:control_ganado/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de ganado',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
      ],
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta llamada: $settings.name');
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePage()
        );
      },
    );
  }
}