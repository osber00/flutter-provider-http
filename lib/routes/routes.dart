import 'package:flutter/material.dart';

import '../screens/screens.dart';

class RutasApp{

  static const rutaInicial = 'inicio';

  static Map<String, Widget Function(BuildContext)> rutas = <String, WidgetBuilder>
  {
    'inicio'    : (BuildContext context) => const InicioScreen(),
    'estrenos'  : (_) => const EstrenosScreen(),
    'populares' : (_) => const PopularesScreen()
  };
}