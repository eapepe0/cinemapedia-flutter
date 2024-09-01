// lib\domain\datasource\movies_datasource.dart
//
// Definimos una interfaz que nos proporciona acceso a los datos de las peliculas 
// Una interfaz es un contrato que define un conjunto de metodos que deben ser implementados por cualquier 
// clase que la implemente.
//
// La interfaz es abstracta , no se puede instancia por eso vamos a crear una implementacion
//
// MovieDatasource se usa como una capa de abstraccion entre la logica de negocio y la fuente de datos
// Esto permite cambiar la fuente de datos sin afectar la lógica de negocio.

//
// se encarga de obtener los datos de las películas de la fuente de datos, 
// pero no procesa ni transforma esos datos de ninguna manera.
//
//

import 'package:cinemapedia/domain/entities/movie.dart';

// es abstracta por que no la vamos a instanciar
abstract class MoviesDatasource {
  // metodo : devuelve una lista de peliculas en cartelera
  Future <List<Movie>> getNowPlaying({ int page = 1 });

  // devuelve una lista de peliculas populares
  Future <List<Movie>> getPopular({ int page = 1 });

  // devuelve una lista de peliculas mejor puntuadas
  Future <List<Movie>> getTopRated({ int page = 1 });

  // devuelve una lista de peliculas proximas a estrenarse
  Future <List<Movie>> getUpcoming({ int page = 1 });
}

