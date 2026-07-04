import 'dart:io';

import 'package:buzzwire/core/database/app_database.dart';
import 'package:buzzwire/injector.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' show getDatabasesPath;

Future<void> provideDatabaseDependencies() async {
  // Using NativeDatabase with sqflite's getDatabasesPath() so Drift opens the
  // same file Floor previously created, allowing the v1→v2 migration to run
  // and preserving existing saved articles and search history.
  //
  // Normal Drift initialisation (for new apps with no prior Floor DB):
  // final db = AppDatabase(driftDatabase(name: 'app_database'));
  final dbFolder = await getDatabasesPath();
  final file = File(p.join(dbFolder, 'app_database.db'));
  final db = AppDatabase(NativeDatabase(file));
  injector.registerLazySingleton<AppDatabase>(() => db);
}
