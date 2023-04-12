import 'package:equatable/equatable.dart';

import '../../../shared/domain/errors/failure.dart';
import '../../../shared/utils/status.dart';
import '../../domain/entities/movie.dart';

class MovieDetailsState extends Equatable {
  final Status status;
  final Movie? movie;
  final List<Movie>? similarMovies;
  final Failure? failure;
  final bool isLiked;

  const MovieDetailsState({
    this.status = Status.initial,
    this.movie,
    this.similarMovies,
    this.failure,
    this.isLiked = false,
  });

  @override
  List<Object?> get props => [
        status,
        movie,
        similarMovies,
        isLiked,
      ];
  MovieDetailsState copyWith({
    Status? status,
    Movie? movie,
    List<Movie>? similarMovies,
    Failure? failure,
    bool? isLiked,
  }) {
    return MovieDetailsState(
      status: status ?? this.status,
      movie: movie ?? this.movie,
      similarMovies: similarMovies ?? this.similarMovies,
      failure: failure ?? this.failure,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
