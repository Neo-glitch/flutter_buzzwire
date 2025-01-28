import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:buzzwire/core/constants/app_constants.dart';
import 'package:buzzwire/core/utils/extensions/string_extension.dart';
import 'package:buzzwire/core/utils/logging/logger_helper.dart';
import 'package:buzzwire/src/shared/data/model/profile_image_model.dart';
import 'package:buzzwire/src/shared/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ProfileRemoteDataSource {
  Future<void> createUser(UserModel userModel);
  Future<void> updateUser(UserModel userModel);
  Future<UserModel?> getUser(String userId);
  Future<void> deleteUser(UserModel userModel);
  Future<ProfileImageModel> uploadProfileImage(UserModel userModel, File image);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore firestoreDb;
  final Storage appWriteStorage;

  ProfileRemoteDataSourceImpl({
    required this.firestoreDb,
    required this.appWriteStorage,
  });

  @override
  Future<void> createUser(UserModel userModel) async {
    try {
      final docRef = _getUsersCollectionRef
          .withConverter(
            fromFirestore: UserModel.fromFirestore,
            toFirestore: (userModel, options) => userModel.toFirestore(),
          )
          .doc(userModel.userId);
      await docRef.set(userModel);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteUser(UserModel userModel) async {
    try {
      final userId = userModel.userId;
      final fileId = userModel.profileImage?.fileId.orEmpty;
      if (userModel.profileImage != null && await _checkIfFileExists(fileId)) {
        await _deleteFile(fileId!);
      }

      await _getUsersCollectionRef.doc(userId).delete();
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<UserModel?> getUser(String userId) async {
    try {
      final docRef = _getUsersCollectionRef
          .withConverter(
            fromFirestore: UserModel.fromFirestore,
            toFirestore: (userModel, options) => userModel.toFirestore(),
          )
          .doc(userId);
      // set source to just server to get the latest doc saved in server, else throw error
      final userModelDocSnap =
          await docRef.get(const GetOptions(source: Source.server));
      return userModelDocSnap.data();
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    try {
      final docRef = _getUsersCollectionRef
          .withConverter(
            fromFirestore: UserModel.fromFirestore,
            toFirestore: (userModel, options) => userModel.toFirestore(),
          )
          .doc(userModel.userId);
      await docRef.set(userModel);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  @override
  Future<ProfileImageModel> uploadProfileImage(
      UserModel userModel, File image) async {
    try {
      final appWriteProfileImageBucketId =
          dotenv.env[BuzzWireAppConstants.appWriteProfileImageBucketId];
      final appWriteProjectId =
          dotenv.env[BuzzWireAppConstants.appWriteProjectId];
      final appWriteBaseUrl = dotenv.env[BuzzWireAppConstants.appWriteBaseUrl];
      final fileId = userModel.profileImage?.fileId.orEmpty;
      final userId = userModel.userId;
      if (await _checkIfFileExists(fileId)) {
        await _deleteFile(fileId!);
      }
      final response = await appWriteStorage.createFile(
        bucketId: appWriteProfileImageBucketId.orEmpty,
        fileId: ID.unique(),
        file: InputFile.fromPath(
            path: image.path, filename: "$userId.png", contentType: "image/*"),
      );
      final imageUrl =
          "$appWriteBaseUrl/storage/buckets/$appWriteProfileImageBucketId/files/${response.$id}/preview?project=$appWriteProjectId";

      return ProfileImageModel(fileId: response.$id, imageUrl: imageUrl);
    } catch (e, s) {
      BuzzWireLoggerHelper.error(s.toString());
      rethrow;
    }
  }

  Future<void> _deleteFile(String fileId) async {
    final appWriteProfileImageBucketId =
        dotenv.env[BuzzWireAppConstants.appWriteProfileImageBucketId];
    await appWriteStorage.deleteFile(
      bucketId: appWriteProfileImageBucketId.orEmpty,
      fileId: fileId,
    );
  }

  Future<bool> _checkIfFileExists(String? fileId) async {
    try {
      final appWriteProfileImageBucketId =
          dotenv.env[BuzzWireAppConstants.appWriteProfileImageBucketId];

      if (fileId == null) return false;

      await appWriteStorage.getFile(
        bucketId: appWriteProfileImageBucketId.orEmpty,
        fileId: fileId,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  CollectionReference<Map<String, dynamic>> get _getUsersCollectionRef =>
      firestoreDb.collection(BuzzWireAppConstants.usersCollecton);
}
