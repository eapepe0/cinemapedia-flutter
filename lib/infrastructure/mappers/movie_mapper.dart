// lib\infrastructure\mappers\movie_mapper.dart

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviesdb/movie_result_moviedb.dart';


// convertimos el resultado de la respuesta de la api en nuestra entidad Movie

class MovieMapper{
  static Movie movieDBToEntity(MovieResultMovieDB moviedb) => Movie(
    adult:  moviedb.adult,
    backdropPath: (moviedb.backdropPath != '')
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
      : 'https://easimages.basnop.com/default-image_600.png',
    genreIds: moviedb.genreIds.map((e)=>e.toString()).toList(),
    id : moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath:  (moviedb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
      : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );

}