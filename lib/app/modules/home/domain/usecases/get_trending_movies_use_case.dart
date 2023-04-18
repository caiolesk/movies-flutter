import '../../../movie_detail/domain/entities/movie.dart';
import '../../../shared/domain/usecases/base_usecase.dart';
import '../repositories/home_repository.dart';

class GetTrendingMoviesUseCase extends UseCase<List<Movie>, NoParams> {
  final HomeRepository repository;

  GetTrendingMoviesUseCase({required this.repository});
  @override
  AsyncResult<List<Movie>> call(NoParams params) async {
    return await repository.getTrendingMovies();
  }
}
