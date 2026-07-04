import 'package:buzzwire/core/database/app_database.dart';

import '../../../injector.dart';

Future<void> provideDatabaseDependencies() async {
  final appDatabase = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  injector.registerLazySingleton<AppDatabase>(() => appDatabase);
}