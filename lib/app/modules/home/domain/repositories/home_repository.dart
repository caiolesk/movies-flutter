import '../../../movie_detail/domain/entities/movie.dart';
import '../../../shared/domain/usecases/base_usecase.dart';

abstract class HomeRepository {
  AsyncResult<List<Movie>> getTrendingMovies();
}
