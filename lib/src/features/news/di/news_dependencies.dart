import 'package:buzzwire/injector.dart';
import 'package:buzzwire/src/features/news/data/datasources/local/news_local_datasource.dart';
import 'package:buzzwire/src/features/news/data/datasources/remote/news_remote_datasource.dart';
import 'package:buzzwire/src/features/news/data/repository/news_repository_impl.dart';
import 'package:buzzwire/src/features/news/domain/repository/news_repository.dart';
import 'package:buzzwire/src/features/news/domain/usecases/clear_saved_articles_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_headlines_by_category_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_headlines_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_news_sources_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_news_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_paginated_saved_articles_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_saved_articles_count_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/get_saved_articles_usecase.dart';
import 'package:buzzwire/src/features/news/domain/usecases/save_article_usecase.dart';

Future<void> provideNewsDependencies() async {
  injector.registerFactory<NewsLocalDataSource>(
      () => NewsLocalDataSourceImpl(database: injector()));
  injector.registerFactory<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(dioClient: injector()));

  injector.registerFactory<NewsRepository>(() => NewsRepositoryImpl(
      remoteDataSource: injector(), localDataSource: injector()));

  injector.registerFactory<GetHeadlinesByCategory>(
      () => GetHeadlinesByCategory(repository: injector()));

  injector.registerFactory<GetHeadlines>(
      () => GetHeadlines(repository: injector()));

  injector.registerFactory<GetNewsSources>(
      () => GetNewsSources(repository: injector()));

  injector.registerFactory<GetNews>(() => GetNews(repository: injector()));

  injector.registerFactory<ClearSavedArticles>(
      () => ClearSavedArticles(repository: injector()));

  injector.registerFactory<GetPaginatedSavedArticles>(
      () => GetPaginatedSavedArticles(repository: injector()));

  injector.registerFactory<GetSavedArticlesCount>(
      () => GetSavedArticlesCount(repository: injector()));

  injector.registerFactory<GetSavedArticles>(
      () => GetSavedArticles(repository: injector()));

  injector
      .registerFactory<SaveArticle>(() => SaveArticle(repository: injector()));
}
