import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/search_history/data/datasources/local/search_history_local_datasource.dart';
import 'package:buzzwire/src/features/search_history/data/repository/search_history_repository_impl.dart';
import 'package:buzzwire/src/features/search_history/domain/repository/search_history_repository.dart';
import 'package:buzzwire/src/features/search_history/domain/usecase/clear_search_history_usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/usecase/delete_search_history_usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/usecase/get_search_history_usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/usecase/save_search_history_usecase.dart';

Future<void> provideSearchHistoryDependencies() async {
  injector.registerFactory<SearchHistoryLocalDataSource>(
      () => SearchHistoryLocalDataSourceImpl(database: injector()));

  injector.registerFactory<SearchHistoryRepository>(
      () => SearchHistoryRepositoryImpl(localDataSource: injector()));

  injector.registerFactory<ClearSearchHistory>(
      () => ClearSearchHistory(repository: injector()));

  injector.registerFactory<DeleteSearchHistory>(
      () => DeleteSearchHistory(repository: injector()));

  injector.registerFactory<GetSearchHistory>(
      () => GetSearchHistory(repository: injector()));
  injector.registerFactory<SaveSearchHistory>(
      () => SaveSearchHistory(repository: injector()));
}
