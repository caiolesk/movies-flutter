import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_flutter/app/modules/movie_detail/domain/usecases/get_similar_movies_use_case.dart';
import 'package:movies_flutter/app/modules/shared/domain/usecases/base_usecase.dart';

import '../../movie_mocks.dart';

void main() {
  late MockMovieRepository mockMovieRepository;
  late GetSimilarMoviesUseCase useCase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    useCase = GetSimilarMoviesUseCase(mockMovieRepository);
  });

  group('when get similar movies is successful', () {
    test('should return [Right] with list of movies', () async {
      //arrange
      when(() => mockMovieRepository.getSimilarMovies())
          .thenAnswer((_) async => Right(listMoviesMock));
      //act
      final result = await useCase(NoParams());
      //assert
      expect(result, Right(listMoviesMock));
    });
  });

  group('when get similar movies is unsuccessful', () {
    test('should return [Left] with Failure object', () async {
      //arrage
      when(() => mockMovieRepository.getSimilarMovies())
          .thenAnswer((_) async => Left(failureMock));
      //act
      final result = await useCase(NoParams());
      //assert
      expect(result, Left(failureMock));
    });
  });
}
