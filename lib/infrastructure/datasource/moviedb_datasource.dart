// lib\infrastructure\datasource\moviedb_datasource.dart

import 'package:cinemapedia/config/constant/environment.dart';
import 'package:cinemapedia/domain/datasource/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviesdb/moviedb_response.dart';
import 'package:dio/dio.dart';



class MoviedbDatasource extends MoviesDatasource{

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters:{
        'api_key' : Environment.theMovieDBKey,
        'language': 'es-MX'
      }
    )
  );


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get('/movie/now_playing');  

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb)=> moviedb.posterPath != 'no-poster') // aca estariamos filtrando antes de mapear el resultado
    .where((moviedb)=> moviedb.backdropPath != 'no-poster')
    .map((moviedb) =>
      MovieMapper.movieDBToEntity(moviedb)
    ).toList();


   return movies;
  }




}