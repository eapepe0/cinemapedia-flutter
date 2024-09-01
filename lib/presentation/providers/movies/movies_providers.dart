// lib\presentation\providers\movies\movies_providers.dart

//
// es una clase que se encarga de proporcionar la lógica de negocio para la gestión de películas en la aplicación. 
// Esta clase es un ejemplo de un patrón de diseño conocido como "Provider" o "Repository".
// 
//


import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



// es un statenotifierProvider que maneja las peluculas en cartelera actualmente
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  // El constructor de MoviesNotifier recibe el callback fetchMoreMovies 
  // como parámetro y lo utiliza para inicializar la propiedad correspondiente.
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});


// es un statenotifierProvider que maneja las peliculas populares
final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;

  // El constructor de MoviesNotifier recibe el callback fetchMoreMovies 
  // como parámetro y lo utiliza para inicializar la propiedad correspondiente.
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});


// es un statenotifierProvider que maneja las peliculas populares
final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;

  // El constructor de MoviesNotifier recibe el callback fetchMoreMovies 
  // como parámetro y lo utiliza para inicializar la propiedad correspondiente.
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

// es un statenotifierProvider que maneja las peliculas populares
final upcomingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;

  // El constructor de MoviesNotifier recibe el callback fetchMoreMovies 
  // como parámetro y lo utiliza para inicializar la propiedad correspondiente.
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});


typedef MovieCallback = Future<List<Movie>> Function({ int page});


class MoviesNotifier extends StateNotifier<List<Movie>>{
  int currentPage = 0; // que pagina se esta cargando
  bool isLoading = false;
  MovieCallback fetchMoreMovies; // Un callback que se utiliza para obtener más películas cuando se llama al método loadNextPage.


  MoviesNotifier({
    required this.fetchMoreMovies,
  }) : super([]);


  Future<void> loadNextPage()async{

    if(isLoading) return; // si esta cargando salimos

    isLoading = true;
    print('Loading mas providers');
    currentPage ++ ;
 
    final List<Movie> movies = await fetchMoreMovies(page : currentPage);

    state = [...state , ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}