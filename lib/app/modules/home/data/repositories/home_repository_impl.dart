import 'package:dartz/dartz.dart';

import '../../../shared/domain/errors/failure.dart';
import '../../../shared/domain/usecases/base_usecase.dart';
import '../../../movie_detail/domain/entities/movie.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl({required this.dataSource});
  @override
  AsyncResult<List<Movie>> getTrendingMovies() async {
    try {
      final result = await dataSource.getTrendingMovies();

      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }
}
