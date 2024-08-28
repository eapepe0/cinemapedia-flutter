// lib\infrastructure\models\moviesdb\moviedb_response.dart

//
//  La clase MovieDbResponse representa un objeto que tiene 
// la informacion devuelta por la API de The Movie Database (TMDB)
//
//
// Esta creada por la pagina https://app.quicktype.io/
//
// en esta dividimos la clase en 2 , una clase la respuesta moviedb_response y otra el resultado movie_result_moviedb


import 'package:cinemapedia/infrastructure/models/moviesdb/movie_result_moviedb.dart';

class MovieDbResponse {
    final Dates? dates;
    final int page;
    final List<MovieResultMovieDB> results;
    final int totalPages;
    final int totalResults;

    MovieDbResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory MovieDbResponse.fromJson(Map<String, dynamic> json) => MovieDbResponse(
        dates: json["dates"] != null ? Dates.fromJson(json["dates"]) : null , // si el json viene con dates lo proceso sino null
        page: json["page"],
        results: List<MovieResultMovieDB>.from(json["results"].map((x) => MovieResultMovieDB.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "dates": dates == null ? {} : dates?.toJson(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Dates {
    final DateTime maximum;
    final DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}

