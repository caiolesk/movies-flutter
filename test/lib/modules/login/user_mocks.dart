import 'package:mocktail/mocktail.dart';
import 'package:movies_flutter/app/modules/login/domain/entities/user.dart';
import 'package:movies_flutter/app/modules/login/domain/repositories/login_repository.dart';
import 'package:movies_flutter/app/modules/shared/domain/errors/failure.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

final usersMock = [
  User(name: 'Test', imagePath: 'imagePath'),
];

final exceptionMock = Exception();

final Failure failureUserMock = Failure(exception: exceptionMock);
