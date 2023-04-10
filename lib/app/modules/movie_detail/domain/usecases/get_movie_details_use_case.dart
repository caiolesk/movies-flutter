import '../../../shared/domain/usecases/base_usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetailsUseCase extends UseCase<Movie, GetMovieDetailsParams> {
  final MovieRepository repository;

  GetMovieDetailsUseCase(this.repository);

  @override
  AsyncResult<Movie> call(GetMovieDetailsParams params) {
    return repository.getMovieDetails(params);
  }
}

class GetMovieDetailsParams {
  final int movieId;

  GetMovieDetailsParams(this.movieId);
}
