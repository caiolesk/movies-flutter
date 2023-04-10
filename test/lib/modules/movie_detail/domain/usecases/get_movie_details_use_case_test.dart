import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_flutter/app/modules/movie_detail/domain/usecases/get_movie_details_use_case.dart';

import '../../movie_mocks.dart';

void main() {
  late MockMovieRepository mockMovieRepository;
  late GetMovieDetailsUseCase useCase;

  setUp(() {
    registerFallbackValue(movieParams);
    mockMovieRepository = MockMovieRepository();
    useCase = GetMovieDetailsUseCase(mockMovieRepository);
  });

  group('when get movie details is successful', () {
    test('should return [Right] with movie', () async {
      //arrange
      when(() => mockMovieRepository.getMovieDetails(any()))
          .thenAnswer((_) async => Right(movieMock));
      //act
      final result = await useCase(GetMovieDetailsParams(movieId));
      //assert
      expect(result, Right(movieMock));
    });
  });

  group('when get movie details is unsuccessful', () {
    test('should return [Left] with Failure', () async {
      //arrange
      when(() => mockMovieRepository.getMovieDetails(any()))
          .thenAnswer((_) async => Left(failureMock));
      //act
      final result = await useCase(movieParams);
      //assert
      expect(result, Left(failureMock));
    });
  });
}
