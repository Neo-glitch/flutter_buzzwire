import 'package:buzzwire/core/cache/di/cache_dependencies.dart';
import 'package:buzzwire/core/common/di/common_dependencies.dart';
import 'package:buzzwire/core/config/di/config_dependencies.dart';
import 'package:buzzwire/core/data/di/data_dependencies.dart';
import 'package:buzzwire/core/database/di/database_dependencies.dart';
import 'package:buzzwire/core/domain/di/domain_dependencies.dart';
import 'package:buzzwire/core/network/di/network_dependencies.dart';
import 'package:buzzwire/src/features/auth/di/auth_dependcies.dart';
import 'package:buzzwire/src/features/news/di/news_dependencies.dart';
import 'package:buzzwire/src/features/notification/di/notification_dependencies.dart';
import 'package:buzzwire/src/features/profile/di/profile_dependencies.dart';
import 'package:buzzwire/src/features/search_history/di/search_history_dependencies.dart';
import 'package:buzzwire/src/features/settings/di/settings_dependencies.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> init() async {
  await provideCacheDependencies();
  await provideNetworkDependencies();
  await provideCommonDependencies();
  await provideConfigDependencies();
  await provideDatabaseDependencies();
  await provideDataDependencies();
  await provideDomainDependencies();
  await provideAuthDependencies();
  await provideNewsDependencies();
  await provideProfileDependencies();
  await provideSearchHistoryDependencies();
  await provideSettingsDependencies();
  await provideNotificationDependencies();
}
