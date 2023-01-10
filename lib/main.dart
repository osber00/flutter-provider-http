import 'dart:io';
import 'package:provider/provider.dart';
import 'package:provider_http/providers/provider_peliculas.dart';

import 'my_http_overrides.dart';

import 'package:flutter/material.dart';
import 'package:provider_http/routes/routes.dart';
import 'package:provider_http/screens/screens.dart';


void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const EstadoApp());
}

class EstadoApp extends StatelessWidget {
  const EstadoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderPeliculas(), lazy: false)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RutasApp.rutaInicial,
      routes: RutasApp.rutas,
      home: const InicioScreen(),
    );
  }
}