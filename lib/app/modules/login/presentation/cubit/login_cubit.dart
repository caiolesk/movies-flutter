// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/domain/usecases/base_usecase.dart';
import '../../../shared/utils/status.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_users_profiles_use_case.dart';
import '../../domain/usecases/save_user_profile_use_case.dart';
import '../../login_navigator.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final GetUsersProfilesUseCase getUsersProfilesUseCase;
  final SaveUserProfileUseCase saveUserProfileUseCase;
  final LoginNavigator loginNavigator;
  LoginCubit({
    required this.getUsersProfilesUseCase,
    required this.saveUserProfileUseCase,
    required this.loginNavigator,
  }) : super(const LoginState());

  Future<void> onInit() async {
    emit(state.copyWith(status: Status.loading));

    final result = await getUsersProfilesUseCase(NoParams());
    result.fold(
      (failure) {
        emit(state.copyWith(status: Status.failure));
      },
      (profiles) {
        emit(state.copyWith(
          status: Status.success,
          usersProfiles: profiles,
        ));
      },
    );
  }

  Future<void> onProfileClick(User profile) async {
    emit(state.copyWith(status: Status.loading));

    final result = await saveUserProfileUseCase(
      SaveUserProfileUseCaseParams(profile: profile),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(status: Status.failure));
      },
      (profiles) {
        emit(state.copyWith(status: Status.success));
        loginNavigator.openHome();
      },
    );
  }
}
