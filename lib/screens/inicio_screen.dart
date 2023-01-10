import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {

  const InicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Inicio'),
      ),
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            ElevatedButton(
              onPressed: () => {
                Navigator.pushNamed(context, 'estrenos')
              },
              child: const Text('Estrenos')
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.pushNamed(context, 'populares')
              },
              child: const Text('Populares')
            ),
          ],
        ),
      ),
    );
  }
}