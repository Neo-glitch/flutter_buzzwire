import 'package:appwrite/appwrite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../../common/extension/string_extension.dart';
import 'package:buzzwire/core/constants/env_keys.dart';
import '../dio/dio_client.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @lazySingleton
  Storage appWriteStorage() {
    final client = Client()
        .setEndpoint(dotenv.env[EnvKeys.appWriteBaseUrl].orEmpty)
        .setProject(dotenv.env[EnvKeys.appWriteProjectId].orEmpty);
    return Storage(client);
  }

  @lazySingleton
  DioClient get dioClient => DioClient();
}
