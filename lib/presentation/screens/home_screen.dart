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
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }
  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider); // lista de Movies que estan en cartelera
    final nowSixPlayingMovies = ref.watch(moviesSlideshowProvider); // lista de seis Peliculas que estan en cartelera

    // SingleChildScrollView es un widget de Flutter que permite a los usuarios 
    // desplazarse verticalmente o horizontalmente a través de un contenido que es más grande 
    //que el espacio disponible en la pantalla.

    return SingleChildScrollView(
      child: Column(
        children: [
        const CustomAppBar(), // barra de abajo
        MoviesSlideshow(movies: nowSixPlayingMovies), //  1er slideshow 
        // en cines
        MovieHorizontalListview(
          movies: nowPlayingMovies,
          title: "En cines",
          subTitle: "Viernes 30",
          loadNextPage: ()=> ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          // le pasamos la funcion loadNextpage del provider nowPlayingMovies
        ),
        MovieHorizontalListview(
          movies: nowPlayingMovies,
          title: "En cines",
          subTitle: "Viernes 30",
          loadNextPage: ()=> ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          // le pasamos la funcion loadNextpage del provider nowPlayingMovies
        ),
        MovieHorizontalListview(
          movies: nowPlayingMovies,
          title: "En cines",
          subTitle: "Viernes 30",
          loadNextPage: ()=> ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          // le pasamos la funcion loadNextpage del provider nowPlayingMovies
        ),
        ],
      ),
    );
    
    
    
  }
}
