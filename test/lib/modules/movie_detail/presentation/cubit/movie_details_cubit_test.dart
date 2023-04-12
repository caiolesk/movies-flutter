import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_flutter/app/modules/movie_detail/presentation/cubit/movie_details_cubit.dart';
import 'package:movies_flutter/app/modules/shared/utils/status.dart';

import '../../movie_mocks.dart';

void main() {
  late MockGetMovieDetailsUseCase mockGetMovieDetailsUseCase;
  late MockGetSimilarMoviesUseCase mockGetSimilarMoviesUseCase;
  late MovieDetailsCubit cubit;

  setUp(() {
    registerFallbackValue(movieParams);
    mockGetMovieDetailsUseCase = MockGetMovieDetailsUseCase();
    mockGetSimilarMoviesUseCase = MockGetSimilarMoviesUseCase();
    cubit = MovieDetailsCubit(
      getMovieDetailsUseCase: mockGetMovieDetailsUseCase,
      getSimilarMoviesUseCase: mockGetSimilarMoviesUseCase,
    );
  });

  group('when [fetchData] is successful', () {
    setUp(() {
      when(() => mockGetMovieDetailsUseCase(any()))
          .thenAnswer((_) async => Right(movieMock));
      when(() => mockGetSimilarMoviesUseCase(any()))
          .thenAnswer((_) async => Right(listMoviesMock));
    });

    test('should init with loading state', () async {
      //act
      cubit.fetchData();
      //assert
      expect(cubit.state.status, Status.loading);
    });

    test('should return a success state', () async {
      //act
      await cubit.fetchData();
      //assert
      expect(cubit.state.status, Status.success);
    });

    test('should return a state with movie', () async {
      //act
      await cubit.fetchData();
      //assert
      expect(cubit.state.movie, movieMock);
    });

    test('should return a state with list similar movies', () async {
      //act
      await cubit.fetchData();
      //assert
      expect(cubit.state.similarMovies, listMoviesMock);
    });
  });

  group('when [fetchData] is unsucessful', () {
    setUp(() {
      when(() => mockGetMovieDetailsUseCase(any()))
          .thenAnswer((_) async => Left(failureMock));
      when(() => mockGetSimilarMoviesUseCase(any()))
          .thenAnswer((_) async => Left(failureMock));
    });
    test('should return state with failure', () async {
      //act
      await cubit.fetchData();
      //assert
      expect(cubit.state.failure, failureMock);
    });

    test('should return state with Status.failure', () async {
      //act
      await cubit.fetchData();
      //assert
      expect(cubit.state.status, Status.failure);
    });
  });

  group('when [setLiked] is called', () {
    test(
      'should emit state with oposite of property of isLiked and status with success',
      () async {
        //arrange
        final expectedIsLiked = !cubit.state.isLiked;
        //act
        cubit.setLiked();
        //assert
        expect(
          cubit.state,
          cubit.state.copyWith(
            status: Status.success,
            isLiked: expectedIsLiked,
          ),
        );
      },
    );
  });
}
