// handles checking and save boolean to verify if user has opened app before
import 'package:buzzwire/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class LocalUserManager {
  Future<Either<Failure, bool>> saveAppEntry();
  Either<Failure, bool> readAppEntry();
}
