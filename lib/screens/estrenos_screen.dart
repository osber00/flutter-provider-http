import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_http/providers/provider_peliculas.dart';
import '../widgets/widgets.dart';

class EstrenosScreen extends StatelessWidget {

  const EstrenosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final providerPeliculas = Provider.of<ProviderPeliculas>(context);
    //print(providerPeliculas.listaEstrenos);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Estrenos'),
      ),
      body:

      providerPeliculas.listaEstrenos.isEmpty
      ?
      const Center(
        child: CircularProgressIndicator(),
      )
      :
      ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: providerPeliculas.listaEstrenos.length,
        itemBuilder: (BuildContext context, int index) {
          final pelicula = providerPeliculas.listaEstrenos[index];
          return CardPelicula(pelicula: pelicula);
        },
      ),
    );
  }
}

