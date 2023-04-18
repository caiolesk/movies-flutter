import 'package:dio/dio.dart';

import '../../../movie_detail/data/models/movie_model.dart';
import '../../../movie_detail/domain/entities/movie.dart';
import '../../../shared/data/errors/failures.dart';
import '../../../shared/network/app_network.dart';

abstract class HomeDataSource {
  Future<List<Movie>> getTrendingMovies();
}

class HomeDataSourceImpl implements HomeDataSource {
  final Dio dio;
  final AppNetwork appNetwork;
  HomeDataSourceImpl({
    required this.dio,
    required this.appNetwork,
  });

  @override
  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await dio.get(
        appNetwork.getTrendingMovies,
        queryParameters: {'api_key': appNetwork.apiKey},
      );

      try {
        final movies = (response.data['results'] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList();

        return movies;
      } catch (error) {
        throw const ParseDataException(
          'Error ParseDataException - [getMovieDetails]',
        );
      }
    } on DioError catch (e) {
      throw SeverException(
        'Error SeverException - [getMovieDetails] message: ${e.message}',
      );
    }
  }
}
