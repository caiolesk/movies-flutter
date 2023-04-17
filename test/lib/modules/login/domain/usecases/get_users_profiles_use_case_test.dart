import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_flutter/app/modules/login/domain/usecases/get_users_profiles_use_case.dart';
import 'package:movies_flutter/app/modules/shared/domain/usecases/base_usecase.dart';

import '../../../mocks.dart';
import '../../user_mocks.dart';

void main() {
  late GetUsersProfilesUseCase useCase;
  late MockLoginRepository mockLoginRepository;
  setUp(() {
    mockLoginRepository = MockLoginRepository();
    useCase = GetUsersProfilesUseCase(repository: mockLoginRepository);
  });

  test('when request is succesful should return [Right] with users', () async {
    //arrange
    when(() => mockLoginRepository.getUsersProfiles())
        .thenAnswer((invocation) async => Right(usersMock));
    //act
    final result = await useCase(NoParams());
    //assert
    expect(result, Right(usersMock));
  });

  test('when is failure should return [Left] with error', () async {
    //arrange
    when(() => mockLoginRepository.getUsersProfiles())
        .thenAnswer((_) async => Left(errorFailure));
    //act
    final result = await useCase(NoParams());
    //assert
    expect(result, Left(errorFailure));
  });
}
