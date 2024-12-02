import '../error/failure.dart';
import '../utils/resource.dart';
import 'package:fpdart/fpdart.dart';

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

abstract class UseCaseStrean<SuccessType, Params> {
  Stream<Either<Failure, SuccessType>> call(Params param);
}

class NoParams {}
