import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movie_detail/domain/entities/movie.dart';
import '../../../shared/domain/usecases/base_usecase.dart';
import '../../../shared/utils/status.dart';
import '../../domain/usecases/get_trending_movies_use_case.dart';
import '../../home_navigator.dart';
import '../../home_strings.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTrendingMoviesUseCase getTrendingMoviesUseCase;
  final HomeNavigator homeNavigator;

  HomeCubit({
    required this.getTrendingMoviesUseCase,
    required this.homeNavigator,
  }) : super(const HomeState());
  Future<void> onInit() async {
    emit(state.copyWith(status: Status.loading));

    await Future.wait([
      //_getTrendingMovie(),
      _getNowPlaying(),
      _getPopulars(),
      _getTopRated(),
      _getUpComing(),
    ]);
  }

  void openMovieDetails(Movie movie) {
    homeNavigator.openMovieDetails(movie);
  }

  Future<void> _getTrendingMovie() async {
    final result = await getTrendingMoviesUseCase(NoParams());
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: Status.failure,
          failure: failure,
        ));
      },
      (list) {
        emit(state.copyWith(
          status: Status.success,
          trendingMovie: list.first,
        ));
      },
    );
  }

  Future<void> _getPopulars() async {
    final result = await getTrendingMoviesUseCase(NoParams());
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: Status.failure,
          failure: failure,
        ));
      },
      (list) {
        list.shuffle();
        emit(state.copyWith(
          status: Status.success,
          listPopular: {HomeStrings.homeGroups.groupPopular: list},
        ));
      },
    );
  }

  Future<void> _getNowPlaying() async {
    final result = await getTrendingMoviesUseCase(NoParams());
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: Status.failure,
          failure: failure,
        ));
      },
      (list) {
        list.shuffle();
        emit(state.copyWith(
          status: Status.success,
          listNowPlaying: {HomeStrings.homeGroups.groupNowPlaying: list},
        ));
      },
    );
  }

  Future<void> _getTopRated() async {
    final result = await getTrendingMoviesUseCase(NoParams());
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: Status.failure,
          failure: failure,
        ));
      },
      (list) {
        list.shuffle();
        emit(state.copyWith(
          status: Status.success,
          listTopRated: {HomeStrings.homeGroups.groupTopRated: list},
        ));
      },
    );
  }

  Future<void> _getUpComing() async {
    final result = await getTrendingMoviesUseCase(NoParams());
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: Status.failure,
          failure: failure,
        ));
      },
      (list) {
        list.shuffle();
        emit(state.copyWith(
          status: Status.success,
          listUpComing: {HomeStrings.homeGroups.groupUpComing: list},
        ));
      },
    );
  }
}
