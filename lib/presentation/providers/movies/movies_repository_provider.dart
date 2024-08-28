// lib\presentation\providers\movies\movies_repository_provider.dart

//  se utiliza en la aplicación para proporcionar una instancia de la clase MovieRepositoryImpl q
// que se puede utilizar para interactuar con la API de TMDB. 
// Por ejemplo, en el archivo movies_providers.dart que analizamos anteriormente, 
// se utiliza este proveedor para obtener una instancia de la clase MovieRepositoryImpl 
// que se utiliza para obtener la lista de películas en cartelera actualmente.
// 
//
//

import 'package:cinemapedia/infrastructure/datasource/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(datasource : MoviedbDatasource());
});