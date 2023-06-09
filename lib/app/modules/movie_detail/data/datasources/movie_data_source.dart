import 'package:dio/dio.dart';

import '../../../shared/data/errors/failures.dart';
import '../../../shared/network/app_network.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movie_details_use_case.dart';
import '../models/movie_model.dart';

abstract class MovieDataSource {
  Future<Movie> getMovieDetails(GetMovieDetailsParams params);
  Future<List<Movie>> getSimilarMovies(GetMovieDetailsParams params);
}

class MovieDataSourceImpl implements MovieDataSource {
  final Dio _dio;
  final AppNetwork _appNetwork;

  MovieDataSourceImpl({
    required Dio dio,
    required AppNetwork appNetwork,
  })  : _dio = dio,
        _appNetwork = appNetwork;

  @override
  Future<Movie> getMovieDetails(GetMovieDetailsParams params) async {
    try {
      final response = await _dio.get(
        '${_appNetwork.getMovieDetails}${params.movieId}',
        queryParameters: {'api_key': _appNetwork.apiKey},
      );

      try {
        final movie = MovieModel.fromJson(response.data);

        return movie;
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

  @override
  Future<List<Movie>> getSimilarMovies(GetMovieDetailsParams params) async {
    try {
      final response = await _dio.get(
        '${_appNetwork.getMovieDetails}${params.movieId}${_appNetwork.getSimilarMovies}',
        queryParameters: {'api_key': _appNetwork.apiKey},
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
