import 'package:equatable/equatable.dart';

class SeverException extends Equatable implements Exception {
  final String message;

  SeverException(this.message);

  @override
  List<Object?> get props => [message];
}

class ParseDataException extends Equatable implements Exception {
  final String message;

  const ParseDataException(this.message);

  @override
  List<Object?> get props => [message];
}

class UnknowException extends Equatable implements Exception {
  final String message;

  const UnknowException(this.message);

  @override
  List<Object?> get props => [message];
}
