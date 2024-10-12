import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/repository/repository_result.dart';
import '../../../core/common/use_case/use_case_result.dart';
import '../../../data/book/book_repository.dart';
import '../../../data/book/entity/book_search_result_entity.dart';
import '../model/search_result_model.dart';

final AutoDisposeProvider<SearchBookUseCase> searchBookUseCaseProvider =
    Provider.autoDispose<SearchBookUseCase>(
  (AutoDisposeRef<SearchBookUseCase> ref) => SearchBookUseCase(
    bookRepository: ref.read(bookRepositoryProvider),
  ),
);

class SearchBookUseCase {
  final BookRepository _bookRepository;
  SearchBookUseCase({
    required BookRepository bookRepository,
  }) : _bookRepository = bookRepository;

  Future<UseCaseResult<SearchResultModel>> call(
      {required String searchKeyword, int? page, int? size}) async {
    final RepositoryResult<BookSearchResultEntity> repositoryResult =
        await _bookRepository.searchBook(
      keyword: searchKeyword,
      page: page,
      size: size,
    );
    return switch (repositoryResult) {
      SuccessRepositoryResult<BookSearchResultEntity>() =>
        SuccessUseCaseResult<SearchResultModel>(
          data: SearchResultModel.fromEntity(
            entity: repositoryResult.data,
          ),
        ),
      FailureRepositoryResult<BookSearchResultEntity>() =>
        FailureUseCaseResult<SearchResultModel>(
          message: repositoryResult.messages?[0],
        )
    };
  }
}
