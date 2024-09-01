import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref){

    final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty; // lista de Movies que estan en cartelera
    final step2 = ref.watch(popularMoviesProvider).isEmpty; // lista de peliculas que estan en popular movies
    final step3 = ref.watch(topRatedMoviesProvider).isEmpty; // lista de peliculas que estan en top movies
    final step4 = ref.watch(upcomingMoviesProvider).isEmpty; // lista de peliculas que se estrenaran proximamente


    if(step1 || step2 || step3 || step4) return true; // si algunos de los providers esta vacio devolvemos true

  return false; // terminamos de cargar
});