import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:provider_http/models/models.dart';

class ProviderPeliculas extends ChangeNotifier{

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '6497ebcb86cff2c4a5dea061f6c35d38';
  final String _languaje = 'es-ES';
  final String _page = '1';

  int paginacion = 0;

  List<PeliculaModel> listaEstrenos = [];
  List<PeliculaModel> listaPopulares = [];

  ProviderPeliculas(){
    getPeliculasEstrenos();
    getPeliculasPopulares();
  }


  getPeliculasEstrenos() async{
     var url = Uri.https(_baseUrl, '3/movie/now_playing',
      {
        'api_key': _apiKey,
        'language': _languaje,
        'page': _page
      }
     );

    var peticion = await http.get(url);
    //var resultado = json.decode(peticion.body);
    //print(resultado['results']);
    var resultados = PeliculasEstrenosResponse.fromJson(peticion.body);
    listaEstrenos = resultados.results;
    notifyListeners();
    //print(resultados.results);

  }

  getPeliculasPopulares() async{
    paginacion ++;
    var url = Uri.https(_baseUrl, '3/movie/popular',
      {
        'api_key': _apiKey,
        'language': _languaje,
        'page': '$paginacion'
      }
     );
     var peticion = await http.get(url);
     var resultados = PeliculasPopularesResponse.fromJson(peticion.body);
     listaPopulares = [...listaPopulares, ...resultados.results];
     notifyListeners();
  }

}