import '../entities/movie.dart';
import '../repositories/movie_repository.dart';
import 'get_movie_details_use_case.dart';
import '../../../shared/domain/usecases/base_usecase.dart';

class GetSimilarMoviesUseCase
    extends UseCase<List<Movie>, GetMovieDetailsParams> {
  final MovieRepository _repository;

  GetSimilarMoviesUseCase(this._repository);

  @override
  AsyncResult<List<Movie>> call(GetMovieDetailsParams params) {
    return _repository.getSimilarMovies(params);
  }
}
