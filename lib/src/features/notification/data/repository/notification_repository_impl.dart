import 'package:buzzwire/core/error/error_text.dart';
import 'package:buzzwire/core/error/exception_handler.dart';
import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/network/network_connection_checker.dart';
import 'package:buzzwire/src/features/notification/data/datasources/remote/notification_remote_datasource.dart';
import 'package:buzzwire/src/features/notification/data/mapper/topic_mapper.dart';
import 'package:buzzwire/src/features/notification/domain/entity/topic_entity.dart';
import 'package:buzzwire/src/features/notification/domain/repository/notification_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/either.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDatasource remoteDatasource;
  final NetworkConnectionChecker networkConnectionChecker;

  NotificationRepositoryImpl({
    required this.remoteDatasource,
    required this.networkConnectionChecker,
  });

  @override
  Future<Either<Failure, void>> deleteUserDeviceTokens(String userId) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;

      if (isConnected) {
        await remoteDatasource.deleteUserDeviceTokens(userId);
        return const Right(unit);
      }
      return Left(FbFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveDeviceToken(String userId) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;

      if (isConnected) {
        await remoteDatasource.saveDeviceToken(userId);
        return const Right(unit);
      }
      return Left(FbFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> subscribeToTopic(String topic) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;

      if (isConnected) {
        await remoteDatasource.subscribeToTopic(topic);
        return const Right(unit);
      }
      return Left(FbFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unsubscribeFromTopic(String topic) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;

      if (isConnected) {
        await remoteDatasource.unsubscribeFromTopic(topic);
        return const Right(unit);
      }
      return Left(FbFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDeviceToken(String userId) async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;

      if (isConnected) {
        await remoteDatasource.deleteToken(userId);
        return const Right(unit);
      }
      return Left(FbFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFailure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TopicEntity>>> getTopics() async {
    try {
      final isConnected = await networkConnectionChecker.isConnected;
      if (isConnected) {
        final topics = await remoteDatasource.getTopics();
        final entities =
            topics.map((model) => TopicMapper.fromModel(model)).toList();
        return Right(entities);
      }
      return Left(FbFailure(ErrorText.noInternetError));
    } on Exception catch (e) {
      final exception = ExceptionHandler.handleException(e);
      return Left(FbFailure(exception.toString()));
    }
  }
}
