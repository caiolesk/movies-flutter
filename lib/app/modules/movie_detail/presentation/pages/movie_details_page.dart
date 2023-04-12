import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/utils/status.dart';
import '../../../shared/utils/string_extensions.dart';
import '../../domain/entities/movie.dart';
import '../cubit/movie_details_cubit.dart';
import '../cubit/movie_details_state.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final MovieDetailsCubit cubit = Modular.get<MovieDetailsCubit>();
  @override
  void initState() {
    cubit.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.status.isLoading) return _loadingWidget();
          switch (state.status) {
            case Status.success:
              return _moviePage(
                state.movie,
                state.similarMovies,
                state.isLiked,
                () {
                  cubit.setLiked();
                },
              );
            default:
              return _errorWidget(
                onButtonTap: () {
                  cubit.fetchData();
                },
              );
          }
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget _moviePage(
    Movie? movie,
    List<Movie>? similarMovies,
    bool isLiked,
    VoidCallback onHeartTap,
  ) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _headerMovie(
            movie: movie,
            onImageTap: () {
              onHeartTap();
            },
            isLiked: isLiked,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: similarMovies?.length ?? 0,
            (context, index) => Padding(
              padding: const EdgeInsets.all(16),
              child: _similarMovieWidget(similarMovies != null
                  ? similarMovies[index]
                  : List.empty()[index]),
            ),
          ),
        ),
      ],
    );
  }

  _headerMovie({
    required Movie? movie,
    required VoidCallback onImageTap,
    required bool isLiked,
  }) {
    return Column(
      children: [
        if (movie?.posterPath.isNotEmpty == true)
          Image.network(
            movie?.posterPath.imageUrlPath() ?? '',
            height: 300,
            fit: BoxFit.cover,
          ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movie?.originalTitle ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  IconButton(
                    icon: isLiked
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_outline),
                    onPressed: () => {onImageTap()},
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.favorite),
                  const SizedBox(width: 5),
                  Text('${movie?.voteCount ?? ''} Likes'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _similarMovieWidget(Movie movie) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Row(
        children: [
          Image.network(
            movie.posterPath.imageUrlPath(),
            height: 100,
            width: 90,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.originalTitle),
                Text(movie.releaseDate.split('-').first),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _errorWidget({required VoidCallback onButtonTap}) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Column(
          children: [
            const Text('Erro ao consultar o filme'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                onButtonTap();
              },
              child: const Text('Tentar novamente'),
            ),
          ],
        ),
      ],
    );
  }
}
