import 'package:dartz/dartz.dart';
import 'package:movies_flutter/app/modules/shared/domain/errors/Failure.dart';

import '../../../shared/domain/usecases/base_usecase.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../domain/usecases/get_movie_details_use_case.dart';
import '../datasources/movie_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImpl(this._dataSource);

  @override
  AsyncResult<Movie> getMovieDetails(GetMovieDetailsParams params) async {
    try {
      final result = await _dataSource.getMovieDetails(params);
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }

  @override
  AsyncResult<List<Movie>> getSimilarMovies(
      GetMovieDetailsParams params) async {
    try {
      final result = await _dataSource.getSimilarMovies(params);
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }
}
