import '../../../shared/domain/usecases/base_usecase.dart';
import '../entities/user.dart';
import '../repositories/login_repository.dart';

class GetUsersProfilesUseCase extends UseCase<List<User>, NoParams> {
  final LoginRepository repository;

  GetUsersProfilesUseCase({required this.repository});
  @override
  AsyncResult<List<User>> call(NoParams params) {
    return repository.getUsersProfiles();
  }
}
