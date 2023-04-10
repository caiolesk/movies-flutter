import 'package:movies_flutter/app/modules/movie_detail/domain/entities/movie.dart';
import 'package:movies_flutter/app/modules/movie_detail/domain/repositories/movie_repository.dart';
import 'package:movies_flutter/app/modules/shared/domain/usecases/base_usecase.dart';

class GetSimilarMoviesUseCase extends UseCase<List<Movie>, NoParams> {
  final MovieRepository _repository;

  GetSimilarMoviesUseCase(this._repository);

  @override
  AsyncResult<List<Movie>> call(NoParams params) {
    return _repository.getSimilarMovies();
  }
}
