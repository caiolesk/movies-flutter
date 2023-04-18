import 'package:flutter/material.dart';

import '../../../movie_detail/domain/entities/movie.dart';
import '../../../shared/constants/app_margins.dart';
import 'home_posters_organism.dart';

class HomeGroupMoviesOrganism extends StatelessWidget {
  final Map<String, List<Movie>> groupWithMovies;
  final void Function(Movie movie) onMovieClick;
  const HomeGroupMoviesOrganism({
    Key? key,
    required this.onMovieClick,
    required this.groupWithMovies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: kMarginDefault,
            top: kMarginDefault,
          ),
          child: Text(
            groupWithMovies.entries.first.key,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
          ),
        ),
        HomePostersOrganism(
          movies: groupWithMovies.values.first,
          onMovieClick: onMovieClick,
        ),
      ],
    );
  }
}
