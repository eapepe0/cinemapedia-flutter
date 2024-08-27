// lib\infrastructure\repositories\movie_repository_impl.dart

import 'package:cinemapedia/domain/datasource/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';


// Esto sirve para cuando se cambie el data source el cambio sea limpio


class MovieRepositoryImpl extends MoviesRepository{

  final MoviesDatasource datasource;

  MovieRepositoryImpl({required this.datasource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);  
  }

}