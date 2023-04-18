import 'package:equatable/equatable.dart';

import '../../../movie_detail/domain/entities/movie.dart';
import '../../../shared/domain/errors/failure.dart';
import '../../../shared/utils/status.dart';

class HomeState extends Equatable {
  final Status status;
  final Movie? trendingMovie;
  final Map<String, List<Movie>>? listNowPlaying;
  final Map<String, List<Movie>>? listPopular;
  final Map<String, List<Movie>>? listTopRated;
  final Map<String, List<Movie>>? listUpComing;
  final Failure? failure;

  const HomeState({
    this.status = Status.initial,
    this.trendingMovie,
    this.listNowPlaying = const {'': []},
    this.listPopular = const {'': []},
    this.listTopRated = const {'': []},
    this.listUpComing = const {'': []},
    this.failure,
  });

  @override
  List<Object?> get props => [
        status,
        trendingMovie,
        listNowPlaying,
        listPopular,
        listTopRated,
        listUpComing,
        failure,
      ];

  HomeState copyWith({
    Status? status,
    Movie? trendingMovie,
    Map<String, List<Movie>>? listNowPlaying,
    Map<String, List<Movie>>? listPopular,
    Map<String, List<Movie>>? listTopRated,
    Map<String, List<Movie>>? listUpComing,
    Failure? failure,
  }) {
    return HomeState(
      status: status ?? this.status,
      trendingMovie: trendingMovie ?? this.trendingMovie,
      listNowPlaying: listNowPlaying ?? this.listNowPlaying,
      listPopular: listPopular ?? this.listPopular,
      listTopRated: listTopRated ?? this.listTopRated,
      listUpComing: listUpComing ?? this.listUpComing,
      failure: failure ?? this.failure,
    );
  }
}
