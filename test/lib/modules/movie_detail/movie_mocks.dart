import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_flutter/app/modules/movie_detail/data/datasources/movie_data_source.dart';
import 'package:movies_flutter/app/modules/movie_detail/data/models/movie_model.dart';
import 'package:movies_flutter/app/modules/movie_detail/domain/entities/movie.dart';
import 'package:movies_flutter/app/modules/movie_detail/domain/repositories/movie_repository.dart';
import 'package:movies_flutter/app/modules/movie_detail/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_flutter/app/modules/movie_detail/domain/usecases/get_similar_movies_use_case.dart';
import 'package:movies_flutter/app/modules/shared/domain/errors/failure.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

class MockMovieDataSouce extends Mock implements MovieDataSource {}

class MockDio extends Mock implements Dio {}

class MockGetMovieDetailsUseCase extends Mock
    implements GetMovieDetailsUseCase {}

class MockGetSimilarMoviesUseCase extends Mock
    implements GetSimilarMoviesUseCase {}

final movieMock = Movie(
  originalTitle: 'title',
  posterPath: 'url/photo',
  voteCount: 10,
  id: 1,
);

final listMoviesMock = [movieMock];

const movieId = 1;

final movieParams = GetMovieDetailsParams(1);

final movieModel = MovieModel(
  originalTitle: 'title',
  posterPath: 'url/photo',
  voteCount: 10,
  id: 1,
);

final Map<String, dynamic> movieModelJson = {
  "original_title": "Teste",
  "poster_path": "url/photo",
  "vote_count": 10,
  "id": 1,
};

final listMovieModelJson = [
  {
    "original_title": "Teste",
    "poster_path": "url/photo",
    "vote_count": 10,
    "id": 1,
  },
];

final exceptionMock = Exception();

final failureMock = Failure(exception: exceptionMock);
