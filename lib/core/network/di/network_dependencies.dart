import 'package:appwrite/appwrite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../injector.dart';
import '../../common/extension/string_extension.dart';
import '../dio/dio_client.dart' show DioClient;
import '../constant/network_constants.dart';

Future<void> provideNetworkDependencies() async {
  final appWriteClient = Client()
      .setEndpoint(dotenv.env[NetworkConstants.appWriteBaseUrl].orEmpty)
      .setProject(dotenv.env[NetworkConstants.appWriteProjectId].orEmpty);

  injector.registerLazySingleton<DioClient>(() => DioClient());
  injector.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  injector.registerLazySingleton<FirebaseFirestore>(
          () => FirebaseFirestore.instance);
  injector.registerLazySingleton<Storage>(() => Storage(appWriteClient));
}