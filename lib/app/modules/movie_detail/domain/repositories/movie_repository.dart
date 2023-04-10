import 'package:dartz/dartz.dart';

import '../../../shared/domain/models/Failure.dart';
import '../entities/movie.dart';
import '../usecases/get_movie_details_use_case.dart';

abstract class MovieRepository {
  Future<Either<Failure, Movie>> getMovieDetails(GetMovieDetailsParams params);
  Future<Either<Failure, List<Movie>>> getSimilarMovies();
}
