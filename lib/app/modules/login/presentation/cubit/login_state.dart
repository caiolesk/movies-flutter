import 'package:equatable/equatable.dart';

import '../../../shared/domain/errors/Failure.dart';
import '../../../shared/utils/status.dart';
import '../../domain/entities/user.dart';

class LoginState extends Equatable {
  final Status status;
  final List<User>? usersProfiles;
  final Failure? failure;
  const LoginState({
    this.status = Status.initial,
    this.usersProfiles,
    this.failure,
  });

  @override
  List<Object?> get props => [
        status,
        usersProfiles,
        failure,
      ];

  LoginState copyWith({
    Status? status,
    List<User>? usersProfiles,
    Failure? failure,
  }) {
    return LoginState(
      status: status ?? this.status,
      usersProfiles: usersProfiles ?? this.usersProfiles,
      failure: failure ?? this.failure,
    );
  }
}
