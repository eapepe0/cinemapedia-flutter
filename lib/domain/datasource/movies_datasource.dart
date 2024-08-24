import 'package:cinemapedia/domain/entities/movie.dart';


// es abstracta por que no la vamos a instanciar
abstract class MoviesDatasource {
  Future <List<Movie>> getNowPlaying({ int page = 1 });
}

