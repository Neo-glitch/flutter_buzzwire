import 'package:buzzwire/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class UseCaseFuture<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract class UseCaseVoid<Param> {
  Future<Either<Failure, void>> call(Param param);
}

abstract class UseCaseStrean<SuccessType, Param> {
  Stream<Either<Failure, SuccessType>> call(Param param);
}

class NoParams {}
