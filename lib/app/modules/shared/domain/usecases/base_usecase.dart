import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<Type, Params> {
  AsyncResult<Type> call(Params params);
}

class NoParams {}

typedef AsyncResult<Type> = Future<Either<Failure, Type>>;
