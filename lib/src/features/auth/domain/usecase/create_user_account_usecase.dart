import 'package:buzzwire/core/error/error_text.dart';
import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/profile/domain/repository/profile_repository.dart';
import 'package:buzzwire/src/shared/domain/entity/country_entity.dart';
import 'package:buzzwire/src/shared/domain/entity/user_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/either.dart';

class CreateUserAccountUseCase
    implements UseCaseFutureVoid<CreateUserAccountParam> {
  final ProfileRepository profileRepo;

  CreateUserAccountUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, void>> call(CreateUserAccountParam param) async {
    return await profileRepo.createUser(
      UserEntity(
        userId: param.userId,
        email: param.email,
        userName: param.userName,
        country: param.country,
        phoneNumber: param.phone,
      ),
    );
  }
}

class CreateUserAccountParam {
  final String userId;
  final String email;
  final String userName;
  CountryEntity country;
  String? phone;

  CreateUserAccountParam({
    required this.userId,
    required this.email,
    required this.userName,
    required this.country,
    this.phone,
  });
}
