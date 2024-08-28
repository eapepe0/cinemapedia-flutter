// lib\infrastructure\datasource\moviedb_datasource.dart

//
// tiene la implementación de la interfaz MoviesDatasource llamada MoviedbDatasource
// es una clase que se encarga de obtener los datos de las películas de la API de The Movie Database (TMDB). 
// Esta clase utiliza la biblioteca Dio para realizar solicitudes HTTP a la API de TMDB.
//
// La clase MoviedbDatasource extiende la interfaz MoviesDatasource, 
// lo que significa que debe implementar los métodos definidos en esa interfaz. (getNowPlaying)
//
//
//

import 'package:cinemapedia/config/constant/environment.dart';
import 'package:cinemapedia/domain/datasource/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviesdb/moviedb_response.dart';
import 'package:dio/dio.dart';



class MoviedbDatasource extends MoviesDatasource{

  // constructor de una instancia de DIO
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

  // metodo
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get('/movie/now_playing');  // hacemos la llamada a la url 

    // convertimos la respuesta JSON en un MovieDbResponse
    //  que es una lista de movies , los resultados , las paginas
    final movieDBResponse = MovieDbResponse.fromJson(response.data); 

    // una List (Lista) de la entidad Movie se guardaria el resultado de movieDBResponse
    final List<Movie> movies = movieDBResponse.results
    .where((moviedb)=> moviedb.posterPath != 'no-poster') // aca estariamos filtrando antes de mapear el resultado
    .where((moviedb)=> moviedb.backdropPath != 'no-poster')
    .map((moviedb) =>
      MovieMapper.movieDBToEntity(moviedb) // pasamos cada item (moviedb) de la lista movies a la entidad Movies con el mapper
    ).toList(); // convertimos todo a una lista


   return movies; // devolvemos movies que es una lista de movies
  }




}