import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:buzzwire/core/common/extension/string_extension.dart';
import 'package:buzzwire/core/data/datasource/profile/profile_remote_datasource.dart';
import 'package:buzzwire/core/data/model/profile_image_model.dart';
import 'package:buzzwire/core/data/model/user_model.dart';
import 'package:buzzwire/core/constants/env_keys.dart';
import 'package:buzzwire/core/constants/firebase_collection_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore firestoreDb;
  final Storage appWriteStorage;

  ProfileRemoteDataSourceImpl({
    required this.firestoreDb,
    required this.appWriteStorage,
  });

  @override
  Future<void> createUser(UserModel userModel) async {
    final docRef = _getUsersCollectionRef
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (userModel, options) => userModel.toFirestore(),
        )
        .doc(userModel.userId);
    await docRef.set(userModel);
  }

  @override
  Future<void> deleteUser(UserModel userModel) async {
    final userId = userModel.userId;
    final fileId = userModel.profileImage?.fileId.orEmpty;
    if (userModel.profileImage != null && await _checkIfFileExists(fileId)) {
      await _deleteFile(fileId!);
    }

    await _getUsersCollectionRef.doc(userId).delete();
  }

  @override
  Future<UserModel?> getUser(String userId) async {
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
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    final docRef = _getUsersCollectionRef
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (userModel, options) => userModel.toFirestore(),
        )
        .doc(userModel.userId);
    await docRef.set(userModel);
  }

  @override
  Future<ProfileImageModel> uploadProfileImage(
      UserModel userModel, File image) async {
    final appWriteProfileImageBucketId =
        dotenv.env[EnvKeys.appWriteProfileImageBucketId];
    final appWriteProjectId = dotenv.env[EnvKeys.appWriteProjectId];
    final appWriteBaseUrl = dotenv.env[EnvKeys.appWriteBaseUrl];
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
  }

  Future<void> _deleteFile(String fileId) async {
    final appWriteProfileImageBucketId =
        dotenv.env[EnvKeys.appWriteProfileImageBucketId];
    await appWriteStorage.deleteFile(
      bucketId: appWriteProfileImageBucketId.orEmpty,
      fileId: fileId,
    );
  }

  Future<bool> _checkIfFileExists(String? fileId) async {
    try {
      final appWriteProfileImageBucketId =
          dotenv.env[EnvKeys.appWriteProfileImageBucketId];

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
      firestoreDb.collection(FirebaseCollectionConstants.usersCollection);
}
