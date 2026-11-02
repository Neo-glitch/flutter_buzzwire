import 'dart:io';

import 'package:buzzwire/core/data/datasource/profile/profile_remote_datasource.dart';
import 'package:buzzwire/core/data/model/profile_image_model.dart';
import 'package:buzzwire/core/data/model/user_model.dart';
import 'package:buzzwire/core/constants/firebase_collection_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore firestoreDb;
  final FirebaseStorage firebaseStorage;

  static const String _profileImagesPath = 'profile_images';
  static const String _fallbackContentType = 'image/jpeg';
  static const String _objectNotFoundCode = 'object-not-found';

  ProfileRemoteDataSourceImpl({
    required this.firestoreDb,
    required this.firebaseStorage,
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
    await _deleteProfileImage(userId);
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
    // same path per user, so a new upload overwrites the previous photo
    final ref = firebaseStorage.ref('$_profileImagesPath/${userModel.userId}');
    final contentType = lookupMimeType(image.path) ?? _fallbackContentType;
    await ref.putFile(image, SettableMetadata(contentType: contentType));
    final imageUrl = await ref.getDownloadURL();

    return ProfileImageModel(fileId: ref.fullPath, imageUrl: imageUrl);
  }

  Future<void> _deleteProfileImage(String userId) async {
    try {
      await firebaseStorage.ref('$_profileImagesPath/$userId').delete();
    } on FirebaseException catch (e) {
      if (e.code != _objectNotFoundCode) rethrow;
    }
  }

  CollectionReference<Map<String, dynamic>> get _getUsersCollectionRef =>
      firestoreDb.collection(FirebaseCollectionConstants.usersCollection);
}
