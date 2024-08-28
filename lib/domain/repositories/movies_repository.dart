// lib\domain\repositories\movies_repository.dart

//
//  se encarga de proporcionar acceso a los datos de las películas de manera abstracta.
//  se enfoca en la lógica de negocio en lugar de la fuente de datos. 
//
// Es una interfaz que define la lógica de negocio para acceder a los datos de las películas.
// Se encarga de proporcionar acceso a los datos de las películas procesados y transformados según sea necesario.
//
// Utiliza una instancia de MoviesDatasource para obtener los datos de la fuente de datos.
//

import 'package:cinemapedia/domain/entities/movie.dart';


// es abstracta por que no la vamos a instanciar
abstract class MoviesRepository {
  Future <List<Movie>> getNowPlaying({ int page = 1 });
}

