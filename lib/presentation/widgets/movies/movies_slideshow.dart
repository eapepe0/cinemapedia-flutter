import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';



class MoviesSlideshow extends StatelessWidget {

  final List<Movie> movies;
  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemCount: movies.length,
        itemBuilder: (context , index)=>_Slide(movie: movies[index])
      ),
    );
  }
}


class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10)
        )
      ]
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius : BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            // si empieza a cargar la imagen de miniatura
            loadingBuilder: (context, child, loadingProgress) {
              if(loadingProgress != null){ // si no termino la carga
                return const DecoratedBox( // mostramos una decoracion de un negro clarito
                  decoration: BoxDecoration(
                    color: Colors.black12
                  )
                );
              }
              // si cargo devolvemos el child (Image.network)
            return FadeIn(child: child);
            },
        )
      ),
      ),
      
    );
  }
}