import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_flutter/app/modules/movie_detail/data/datasources/movie_data_source.dart';
import 'package:movies_flutter/app/modules/movie_detail/data/models/movie_model.dart';
import 'package:movies_flutter/app/modules/movie_detail/domain/entities/movie.dart';
import 'package:movies_flutter/app/modules/shared/data/errors/failures.dart';
import 'package:movies_flutter/app/modules/shared/network/app_network.dart';

import '../../movie_mocks.dart';

void main() {
  late MockDio mockDio;
  late AppNetwork appNetwork;
  late MovieDataSourceImpl dataSource;
  setUp(() {
    mockDio = MockDio();
    appNetwork = AppNetwork();
    dataSource = MovieDataSourceImpl(
      dio: mockDio,
      appNetwork: appNetwork,
    );
  });

  group('when method [getMovieDetails] is called', () {
    test('when method return success with movie data', () async {
      //arrange
      when(() => mockDio.get(any())).thenAnswer((_) async => Response(
            statusCode: 200,
            requestOptions: RequestOptions(),
            data: movieModelJson,
          ));
      //act
      final result = dataSource.getMovieDetails(movieParams);
      //assert
      expect(result, isA<Future<Movie>>());
    });

    test('when call throw an DioError', () async {
      //arrange
      when(() => mockDio.get(any()))
          .thenThrow(DioError(requestOptions: RequestOptions()));
      //act
      final result = dataSource.getMovieDetails(movieParams);
      //assert
      expect(result, throwsA(isA<SeverException>()));
    });
  });

  group('when method [getSimilarMovies] is called', () {
    test('when method return success with movie data', () async {
      //arrange
      when(() => mockDio.get(any())).thenAnswer((_) async => Response(
            statusCode: 200,
            requestOptions: RequestOptions(),
            data: listMovieModelJson,
          ));
      //act
      final result = dataSource.getSimilarMovies(movieParams);
      //assert
      expect(result, isA<Future<List<Movie>>>());
    });

    test('when call throw an DioError', () async {
      //arrange
      when(() => mockDio.get(any()))
          .thenThrow(DioError(requestOptions: RequestOptions()));
      //act
      final result = dataSource.getSimilarMovies(movieParams);
      //assert
      expect(result, throwsA(isA<SeverException>()));
    });
  });
}
