import 'package:flutter/material.dart';

import '../../../movie_detail/domain/entities/movie.dart';
import '../../../shared/constants/app_margins.dart';
import '../../../shared/utils/string_extensions.dart';
import '../atoms/home_poster_atom.dart';

class HomePostersOrganism extends StatelessWidget {
  final List<Movie> movies;
  final void Function(Movie movie) onMovieClick;
  const HomePostersOrganism({
    Key? key,
    required this.movies,
    required this.onMovieClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(kMarginSmall),
        clipBehavior: Clip.antiAlias,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return Padding(
            padding: const EdgeInsets.all(kMarginDetail),
            child: InkWell(
              onTap: () => onMovieClick(movie),
              child: HomePosterAtom(imageUrl: movie.posterPath.imageUrlPath()),
            ),
          );
        },
      ),
    );
  }
}
