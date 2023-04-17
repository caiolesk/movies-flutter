import '../../../shared/domain/usecases/base_usecase.dart';
import '../entities/user.dart';
import '../repositories/login_repository.dart';

class SaveUserProfileUseCase
    extends UseCase<void, SaveUserProfileUseCaseParams> {
  final LoginRepository repository;

  SaveUserProfileUseCase({required this.repository});
  @override
  AsyncResult<void> call(SaveUserProfileUseCaseParams params) async {
    return await repository.saveUserProfile(params.profile);
  }
}

class SaveUserProfileUseCaseParams {
  final User profile;
  SaveUserProfileUseCaseParams({
    required this.profile,
  });
}
