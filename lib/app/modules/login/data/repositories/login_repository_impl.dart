import 'package:dartz/dartz.dart';

import '../../../shared/domain/errors/failure.dart';
import '../../../shared/domain/usecases/base_usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl({required this.dataSource});

  @override
  AsyncResult<List<User>> getUsersProfiles() async {
    try {
      final result = await dataSource.getUsersProfiles();

      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }

  @override
  AsyncResult<void> saveUserProfile(User user) async {
    try {
      final result = await dataSource.saveUserProfile(user);

      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }
}
