// lib/presentation/screens/home_screen.dart

import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
 
class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      body:  _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    // hacemos la carga inicial del loadNextPage de todos los notifier
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }
  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider); // lista de Movies que estan en cartelera
    final nowSixPlayingMovies = ref.watch(moviesSlideshowProvider); // lista de seis Peliculas que estan en cartelera
    final popularMovies = ref.watch(popularMoviesProvider); // lista de peliculas que estan en popular movies
    final topMovies = ref.watch(topRatedMoviesProvider); // lista de peliculas que estan en top movies
    final upcomingMovies = ref.watch(upcomingMoviesProvider); // lista de peliculas que se estrenaran proximamente

    // SingleChildScrollView es un widget de Flutter que permite a los usuarios 
    // desplazarse verticalmente o horizontalmente a través de un contenido que es más grande 
    //que el espacio disponible en la pantalla.



    return CustomScrollView(
      // manga
      slivers: [ // lista de widgets que van a componer la manga
        const SliverAppBar( // appbar de la manga
          floating: true,
          title: CustomAppBar(), //  en el titulo colocamos el widget CustomAppBar
        ),
        SliverList( // lista de la manga
          delegate: SliverChildBuilderDelegate( // widget que crea la lista en la manga
            (context , index){
              return Column(
                children: [
                  //const CustomAppBar(), // barra de abajo
                  MoviesSlideshow(movies: nowSixPlayingMovies), //  1er slideshow 

                  // en cines
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: "En cines",
                    subTitle: "Viernes 30",
                    loadNextPage: ()=> ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                    // le pasamos la funcion loadNextpage del provider nowPlayingMovies
                  ),
                  // Populares
                  MovieHorizontalListview(
                    movies: popularMovies,
                    title: "Populares",
                    //subTitle: "Viernes 30",
                    loadNextPage: ()=> ref.read(popularMoviesProvider.notifier).loadNextPage(),
                    // le pasamos la funcion loadNextpage del provider nowPlayingMovies
                  ),
                  // Mejores puntuadas
                  MovieHorizontalListview(
                  movies: topMovies,
                  title: "Mejor puntuadas",
                  //subTitle: "Viernes 30",
                  loadNextPage: ()=> ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
                  // le pasamos la funcion loadNextpage del provider nowPlayingMovies
                ),
                // Proximamente
                MovieHorizontalListview(
                  movies: upcomingMovies,
                  title: "Proximamente",
                  //subTitle: "Viernes 30",
                  loadNextPage: ()=> ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
                  // le pasamos la funcion loadNextpage del provider nowPlayingMovies
                ),
                ]
              );
            },
            childCount: 1 // ponemos uno , si ponemos mas repite la cantidad de children
          )
        )
      ],
      );
    
    
    
  }
}
