import 'package:fpdart/fpdart.dart';

import '../error/failure.dart';

abstract class UseCaseFuture<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params param);
}

abstract class UseCaseFutureVoid<Params> {
  Future<Either<Failure, void>> call(Params param);
}

abstract class UseCaseVoid<Params> {
  Either<Failure, void> call(Params param);
}

abstract class UseCaseResult<SuccessType, Params> {
  Either<Failure, SuccessType> call(Params param);
}

abstract class UseCaseStream<SuccessType, Params> {
  Stream<Either<Failure, SuccessType>> call(Params param);
}

class NoParams {}
