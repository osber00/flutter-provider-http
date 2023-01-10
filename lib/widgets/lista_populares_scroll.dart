import 'package:flutter/material.dart';

import 'widgets.dart';
import 'package:provider_http/models/pelicula_model.dart';

class ListaPopularesScroll extends StatefulWidget {


  final List<PeliculaModel> peliculas;
  final Function fnPaginacion;

  const ListaPopularesScroll({
    Key? key,
    required this.peliculas,
     required this.fnPaginacion,
  }) : super(key: key);

  @override
  State<ListaPopularesScroll> createState() => _ListaPopularesScrollState();
}

class _ListaPopularesScrollState extends State<ListaPopularesScroll> {

  final miScrollController = ScrollController();
  bool solicitando = false;

  @override
  void initState() {
    super.initState();
    miScrollController.addListener(() {
      if(miScrollController.position.pixels + 500 >= miScrollController.position.maxScrollExtent){
        hacerSolicitud();
      }
    });
  }


  Future hacerSolicitud() async{
    if(solicitando == true) return;

    solicitando = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    widget.fnPaginacion();
    //print('trabajando...');

    solicitando = false;
    setState(() {});

    /* if (miScrollController.position.pixels + 100 <= miScrollController.position.maxScrollExtent) {
      return;
    } */

    /* miScrollController.animateTo(
      miScrollController.position.pixels + 130,
      duration: const Duration(microseconds:600),
      curve: Curves.fastOutSlowIn
    ); */

  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: miScrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.peliculas.length,
      itemBuilder: (BuildContext context, int index) {
        final pelicula = widget.peliculas[index];
        return CardPelicula(pelicula: pelicula);
      },
    );
  }
}