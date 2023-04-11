import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final dynamic exception;
  final dynamic data;

  const Failure({required this.exception, this.data});

  @override
  List<Object?> get props => [exception, data];
}
