import 'package:flutter/material.dart';
import 'package:provider_http/models/models.dart';

class CardPelicula extends StatelessWidget {

  final PeliculaModel pelicula;

  const CardPelicula({
    Key? key,
    required this.pelicula,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            height: 280,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/no-imagen.png'),
            image: NetworkImage(pelicula.imagenbackdropPath)
          ),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(pelicula.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blueGrey)),
                Text(pelicula.originalTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blueGrey)),
                Text('${pelicula.popularity}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blueGrey)),
              ],
            )
          )
        ],
      ),
    );
  }
}