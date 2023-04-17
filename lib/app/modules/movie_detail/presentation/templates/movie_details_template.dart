import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import '../atoms/loading_atom.dart';
import '../organismis/error_dialog_organism.dart';
import '../organismis/movie_header_organism.dart';
import '../organismis/movie_similar_item_organism.dart';

class MovieDetailsTemplate extends StatelessWidget {
  final Movie? movie;
  final bool isLiked;
  final VoidCallback onLikeButtonTap;
  final VoidCallback onErrorTap;
  final List<Movie>? similarMovies;
  final bool isLoading;
  final bool isFailure;
  const MovieDetailsTemplate({
    Key? key,
    required this.movie,
    required this.isLiked,
    required this.onLikeButtonTap,
    required this.onErrorTap,
    required this.similarMovies,
    required this.isLoading,
    required this.isFailure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (isFailure)
          SliverFillRemaining(
            child: Center(
              child: ErrorDialogOrganism(
                onErrorButtonTap: onErrorTap,
              ),
            ),
          ),
        if (isLoading)
          const SliverFillRemaining(
            child: Center(child: LoadingAtom()),
          ),
        SliverToBoxAdapter(
          child: movie != null
              ? MovieHeaderOrganism(
                  movie: movie,
                  isLiked: isLiked,
                  onLikeButtonTap: onLikeButtonTap,
                )
              : null,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: similarMovies?.length ?? 0,
            (context, index) {
              final similar =
                  similarMovies != null ? similarMovies![index] : null;
              if (similar != null) {
                return InkWell(
                  child: MovieSimilarItemOrganism(
                    posterPath: similar.posterPath,
                    title: similar.originalTitle,
                    releaseDate: similar.releaseDate,
                  ),
                );
              }

              return null;
            },
          ),
        ),
      ],
    );
  }
}
