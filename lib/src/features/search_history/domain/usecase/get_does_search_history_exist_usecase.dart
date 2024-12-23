import 'package:buzzwire/core/error/failure.dart';
import 'package:buzzwire/core/usecase/usecase.dart';
import 'package:buzzwire/src/features/search_history/domain/repository/search_history_repository.dart';
import 'package:fpdart/src/either.dart';

class GetDoesSearchHistoryExist
    implements UseCaseFuture<bool, GetDoesSearchHistoryExistParam> {
  final SearchHistoryRepository repository;

  GetDoesSearchHistoryExist({required this.repository});

  @override
  Future<Either<Failure, bool>> call(GetDoesSearchHistoryExistParam param) {
    return repository.doesSearchHistoryExist(param.search, param.articleTitle);
  }
}

class GetDoesSearchHistoryExistParam {
  final String? search;
  final String? articleTitle;

  GetDoesSearchHistoryExistParam({this.search, this.articleTitle});
}
