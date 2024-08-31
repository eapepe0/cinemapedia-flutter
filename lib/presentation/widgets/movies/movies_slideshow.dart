import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';



class MoviesSlideshow extends StatelessWidget {

  final List<Movie> movies; // creamos una lista de la entidad Movie llamado movies

  const MoviesSlideshow({super.key, required this.movies}); // parametros

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme; // sacamos los colores del tema

    return SizedBox( // creo una caja de tamaño definido
      height: 210,
      width: double.infinity, // tod@ el ancho disponible
      child: Swiper(
        viewportFraction: 0.8, // tamaño
        scale: 0.9, // escala
        autoplay: true, // se activa solo
        itemCount: movies.length, // tamaño de el swiper 
        // creamos un builder , donde le pasamos una pelicula a cada miniatura
        itemBuilder: (context , index)=>_Slide(movie: movies[index]), 
        // creamos los puntitos de la pagina
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0), // le damos un margen en 0 para que no tenga
          // le damos colores a los puntos
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: Colors.black12,
          )
        ),
      ),
    );
  }
}


// clase de cada miniatura
class _Slide extends StatelessWidget {
  final Movie movie; // una movie del tipo Movie
  
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    // decoraciones para las miniaturas
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