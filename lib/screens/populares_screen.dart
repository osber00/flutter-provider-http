import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_http/providers/provider_peliculas.dart';
import 'package:provider_http/widgets/widgets.dart';

class PopularesScreen extends StatelessWidget {

  const PopularesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProviderPeliculas providerPeliculas = Provider.of<ProviderPeliculas>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de peliculas populares'),
        centerTitle: true,
      ),
      body:
      providerPeliculas.listaPopulares.isEmpty
      ?
      const Center(
        child: CircularProgressIndicator(),
      )
      :
      ListaPopularesScroll(peliculas: providerPeliculas.listaPopulares, fnPaginacion: ()=>{providerPeliculas.getPeliculasPopulares()}),
    );
  }
}

