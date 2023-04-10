import 'package:mocktail/mocktail.dart';
import 'package:movies_flutter/app/modules/movie_detail/domain/entities/movie.dart';
import 'package:movies_flutter/app/modules/movie_detail/domain/repositories/movie_repository.dart';
import 'package:movies_flutter/app/modules/movie_detail/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_flutter/app/modules/shared/domain/models/Failure.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

final movieMock = Movie(
  originalTitle: 'title',
  posterPath: 'url/photo',
  voteCount: 10,
  id: 1,
);

final movieId = 1;

final movieParams = GetMovieDetailsParams(1);

final exceptionMock = Exception();

final failureMock = Failure(exception: exceptionMock);
