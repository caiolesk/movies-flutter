import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movie_details_use_case.dart';

abstract class MovieDataSource {
  Future<Movie> getMovieDetails(GetMovieDetailsParams params);
  Future<List<Movie>> getSimilarMovies();
}
