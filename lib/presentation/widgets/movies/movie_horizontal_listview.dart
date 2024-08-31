import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies; // lista de peliculas como la entidad Movie
  final String? title; // una string titulo
  final String? subTitle; // una string subtitulo
  final VoidCallback?
      loadNextPage; // una funcion sin retorno que cargue la siguiente pagina

  const MovieHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subTitle,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: Column(children: [
        if (title != null ||
            subTitle != null) // si existe un titulo y un subtitulo
          _Title(
              title: title,
              subTitle: subTitle), // mostramos en cine y el boton con la fecha
        Expanded(
            child: ListView.builder(
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return _Slide(movie: movies[index]);
                }))
      ]),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Poster(
                movie:
                    movie), // aca tenemos el poster de la pelicual con el redondeado
            const SizedBox(height: 5), // separacion
            _TituloPelicula(
                movie:
                    movie), // nombre de la pelicula por ejemplo Jurassic Park
            _EstrellaPuntuacionRating(movie: movie)
          ],
        ));
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        if (title != null) Text(title!, style: titleStyle),
        const Spacer(),
        if (subTitle != null)
          FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subTitle!))
      ]),
    );
  }
}

class _Poster extends StatelessWidget {
  final Movie movie;
  const _Poster({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          movie.posterPath,
          width: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress != null) {
              return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Center(child: CircularProgressIndicator(strokeWidth: 2)));
            }
            return FadeIn(child: child);
          },
        ),
      ),
    );
  }
}

class _TituloPelicula extends StatelessWidget {
  final Movie movie;

  const _TituloPelicula({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return SizedBox(
        width: 150,
        child: Text(
          movie.title,
          maxLines: 2,
          style: textStyles.titleSmall,
        ));
  }
}

class _EstrellaPuntuacionRating extends StatelessWidget {
  final Movie movie;
  const _EstrellaPuntuacionRating({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(
          Icons.star_half_outlined,
          color: Colors.yellow.shade800,
        ),
        const SizedBox(width: 3),
        Text('${movie.voteAverage}',
            style:
                textStyles.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
        const SizedBox(width: 10),
        Text('${movie.popularity}', style: textStyles.bodySmall)
      ],
    );
  }
}
