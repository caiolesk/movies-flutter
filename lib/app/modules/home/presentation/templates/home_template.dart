import 'package:flutter/material.dart';

import '../../../movie_detail/domain/entities/movie.dart';
import '../../../movie_detail/presentation/atoms/loading_atom.dart';
import '../organisms/home_group_movies_organism.dart';

class HomeTemplate extends StatelessWidget {
  final Map<String, List<Movie>>? listNowPlaying;
  final Map<String, List<Movie>>? listPopular;
  final Map<String, List<Movie>>? listTopRated;
  final Map<String, List<Movie>>? listUpComing;
  final void Function(Movie movie) onMovieClick;
  final bool isLoading;
  const HomeTemplate({
    Key? key,
    this.listNowPlaying,
    this.listPopular,
    this.listTopRated,
    this.listUpComing,
    required this.onMovieClick,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: isLoading
              ? const Center(child: LoadingAtom())
              : Column(
                  children: [
                    listNowPlaying?.values.isNotEmpty == true
                        ? HomeGroupMoviesOrganism(
                            onMovieClick: onMovieClick,
                            groupWithMovies: listNowPlaying!,
                          )
                        : const SizedBox(),
                    listTopRated?.values.isNotEmpty == true
                        ? HomeGroupMoviesOrganism(
                            onMovieClick: onMovieClick,
                            groupWithMovies: listTopRated!,
                          )
                        : const SizedBox(),
                    listPopular?.values.isNotEmpty == true
                        ? HomeGroupMoviesOrganism(
                            onMovieClick: onMovieClick,
                            groupWithMovies: listPopular!,
                          )
                        : const SizedBox(),
                    listUpComing?.values.isNotEmpty == true
                        ? HomeGroupMoviesOrganism(
                            onMovieClick: onMovieClick,
                            groupWithMovies: listUpComing!,
                          )
                        : const SizedBox(),
                  ],
                ),
        ),
      ),
    );
  }
}
