import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/repository/repository_result.dart';
import '../../../core/common/use_case/use_case_result.dart';
import '../../../data/book/book_repository.dart';
import '../../../data/book/entity/random_book_list_entity.dart';
import '../model/book_model.dart';

final AutoDisposeProvider<GetRandomBookListUseCase>
    getRandomBookListUseCaseProvider =
    Provider.autoDispose<GetRandomBookListUseCase>(
  (AutoDisposeRef<GetRandomBookListUseCase> ref) => GetRandomBookListUseCase(
    bookRepository: ref.read(bookRepositoryProvider),
  ),
);

class GetRandomBookListUseCase {
  final BookRepository _bookRepository;
  GetRandomBookListUseCase({
    required BookRepository bookRepository,
  }) : _bookRepository = bookRepository;

  Future<UseCaseResult<List<BookModel>>> call({
    int? size,
  }) async {
    final RepositoryResult<RandomBookListEntity> repositoryResult =
        await _bookRepository.getBookList(
      // 기본 9개로 고정
      size: size ?? 9,
    );
    return switch (repositoryResult) {
      SuccessRepositoryResult<RandomBookListEntity>() =>
        SuccessUseCaseResult<List<BookModel>>(
          data: List<BookModel>.generate(
            repositoryResult.data.contents.length,
            (int index) => BookModel.fromEntity(
              entity: repositoryResult.data.contents[index],
            ),
          ),
        ),
      FailureRepositoryResult<RandomBookListEntity>() =>
        FailureUseCaseResult<List<BookModel>>(
          message: repositoryResult.messages?[0],
        )
    };
  }
}
