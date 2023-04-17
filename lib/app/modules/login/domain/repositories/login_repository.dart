import '../../../shared/domain/usecases/base_usecase.dart';
import '../entities/user.dart';

abstract class LoginRepository {
  AsyncResult<List<User>> getUsersProfiles();
  AsyncResult<void> saveUserProfile(User user);
}
