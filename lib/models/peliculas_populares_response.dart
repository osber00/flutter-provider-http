import 'dart:convert';

import 'pelicula_model.dart';

class PeliculasPopularesResponse {
    PeliculasPopularesResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<PeliculaModel> results;
    int totalPages;
    int totalResults;

    factory PeliculasPopularesResponse.fromJson(String str) => PeliculasPopularesResponse.fromMap(json.decode(str));

    factory PeliculasPopularesResponse.fromMap(Map<String, dynamic> json) => PeliculasPopularesResponse(
        page: json["page"],
        results: json["results"] == null ? [] : List<PeliculaModel>.from(json["results"]!.map((x) => PeliculaModel.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}
