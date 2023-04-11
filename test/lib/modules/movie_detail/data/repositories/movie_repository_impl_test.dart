import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_flutter/app/modules/movie_detail/data/repositories/movie_repository_impl.dart';

import '../../movie_mocks.dart';

void main() {
  late MockMovieDataSouce mockMovieDataSouce;
  late MovieRepositoryImpl repository;

  setUp(() {
    registerFallbackValue(movieParams);
    mockMovieDataSouce = MockMovieDataSouce();
    repository = MovieRepositoryImpl(mockMovieDataSouce);
  });

  group('when the datasource method [getMovieDetails] is called', () {
    test('when return is successful', () async {
      //arrange
      when(() => mockMovieDataSouce.getMovieDetails(any()))
          .thenAnswer((_) async => movieMock);
      //act
      final result = await repository.getMovieDetails(movieParams);
      //assert
      expect(result, Right(movieMock));
    });

    test('when return is unsuccessful', () async {
      //arrange
      when(() => mockMovieDataSouce.getMovieDetails(any()))
          .thenThrow(exceptionMock);
      //act
      final result = await repository.getMovieDetails(movieParams);
      //assert
      expect(result, Left(failureMock));
    });
  });

  group('when the datasource method [getSimilarMovies] is called', () {
    test('when return is successful', () async {
      //arrange
      when(() => mockMovieDataSouce.getSimilarMovies(any()))
          .thenAnswer((_) async => listMoviesMock);
      //act
      final result = await repository.getSimilarMovies(movieParams);
      //assert
      expect(result, Right(listMoviesMock));
    });

    test('when return is unsuccessful', () async {
      //arrange
      when(() => mockMovieDataSouce.getSimilarMovies(any()))
          .thenThrow(exceptionMock);
      //act
      final result = await repository.getSimilarMovies(movieParams);
      //assert
      expect(result, Left(failureMock));
    });
  });
}
