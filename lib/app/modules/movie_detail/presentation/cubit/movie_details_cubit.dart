import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/status.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movie_details_use_case.dart';
import '../../domain/usecases/get_similar_movies_use_case.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  final MovieDetailsCubitParams params;

  MovieDetailsCubit({
    required this.getMovieDetailsUseCase,
    required this.getSimilarMoviesUseCase,
    required this.params,
  }) : super(const MovieDetailsState());

  Future<void> fetchData() async {
    emit(state.copyWith(status: Status.loading));

    await Future.wait([
      _getMovie(),
      _getSimilarMovies(),
    ]);
  }

  Future<void> _getMovie() async {
    final result =
        await getMovieDetailsUseCase(GetMovieDetailsParams(params.movie.id));
    result.fold(
      (failure) {
        emit(state.copyWith(
          failure: failure,
          status: Status.failure,
        ));
      },
      (movie) {
        emit(state.copyWith(
          movie: movie,
          status: Status.success,
        ));
      },
    );
  }

  Future<void> _getSimilarMovies() async {
    final result =
        await getSimilarMoviesUseCase(GetMovieDetailsParams(params.movie.id));
    result.fold(
      (failure) {
        emit(state.copyWith(
          failure: failure,
          status: Status.failure,
        ));
      },
      (movies) {
        emit(state.copyWith(
          similarMovies: movies,
          status: Status.success,
        ));
      },
    );
  }

  void setLiked() async {
    emit(state.copyWith(
      status: Status.success,
      isLiked: !state.isLiked,
    ));
  }
}

class MovieDetailsCubitParams {
  final Movie movie;
  MovieDetailsCubitParams({
    required this.movie,
  });
}
