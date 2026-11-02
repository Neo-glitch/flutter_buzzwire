import 'package:buzzwire/core/domain/entity/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class LocalUserManager {
  Future<Either<Failure, bool>> saveAppEntry();
  Future<Either<Failure, bool>> readAppEntry();
}
