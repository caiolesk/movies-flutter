import 'package:equatable/equatable.dart';

import '../../../shared/domain/errors/failure.dart';
import '../../../shared/utils/status.dart';
import '../../domain/entities/movie.dart';

class MovieDetailsState extends Equatable {
  final Status status;
  final Movie? movie;
  final List<Movie>? similarMovies;
  final Failure? failure;

  const MovieDetailsState({
    this.status = Status.initial,
    this.movie,
    this.similarMovies,
    this.failure,
  });

  @override
  List<Object?> get props => [
        status,
        movie,
        similarMovies,
      ];
  MovieDetailsState copyWith({
    Status? status,
    Movie? movie,
    List<Movie>? similarMovies,
    Failure? failure,
  }) {
    return MovieDetailsState(
      status: status ?? this.status,
      movie: movie ?? this.movie,
      similarMovies: similarMovies ?? this.similarMovies,
      failure: failure ?? this.failure,
    );
  }
}
