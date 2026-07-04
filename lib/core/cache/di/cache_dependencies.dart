import 'package:shared_preferences/shared_preferences.dart';

import '../../../injector.dart';
import '../buzzwire_app_cache.dart';
import '../buzzwire_app_cache_impl.dart';

Future<void> provideCacheDependencies() async {
  final pref = await SharedPreferences.getInstance();
  injector.registerLazySingleton<BuzzWireAppCache>(
          () => BuzzWireAppCacheImpl(preferences: pref));
}