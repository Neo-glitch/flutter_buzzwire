import 'dart:io';

import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' show getDatabasesPath;

import '../app_database.dart';

@module
abstract class DatabaseModule {
  @preResolve
  @lazySingleton
  Future<AppDatabase> appDatabase() async {
    // Using sqflite's getDatabasesPath so Drift opens the same file Floor
    // previously created, allowing the v1→v2 migration to run.
    final dbFolder = await getDatabasesPath();
    final file = File(p.join(dbFolder, 'app_database.db'));
    return AppDatabase(NativeDatabase(file));
  }
}
