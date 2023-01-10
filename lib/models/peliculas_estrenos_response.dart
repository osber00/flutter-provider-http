import 'dart:convert';

import 'package:provider_http/models/models.dart';

class PeliculasEstrenosResponse {
    PeliculasEstrenosResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    Dates dates;
    int page;
    List<PeliculaModel> results;
    int totalPages;
    int totalResults;

    factory PeliculasEstrenosResponse.fromJson(String str) => PeliculasEstrenosResponse.fromMap(json.decode(str));

    factory PeliculasEstrenosResponse.fromMap(Map<String, dynamic> json) => PeliculasEstrenosResponse(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: json["results"] == null ? [] : List<PeliculaModel>.from(json["results"]!.map((x) => PeliculaModel.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}

class Dates {
    Dates({
        required this.maximum,
        required this.minimum,
    });

    DateTime maximum;
    DateTime minimum;

    factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );
}
