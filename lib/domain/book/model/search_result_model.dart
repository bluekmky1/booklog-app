import 'package:equatable/equatable.dart';

import '../../../data/book/entity/book_search_result_entity.dart';
import 'book_model.dart';

class SearchResultModel extends Equatable {
  const SearchResultModel({
    required this.searchedBookList,
    required this.currentPage,
    required this.totalPages,
    required this.totalElements,
    required this.isEnd,
  });

  final List<BookModel> searchedBookList;
  final int currentPage;
  final int totalPages;
  final int totalElements;
  final bool isEnd;

  factory SearchResultModel.fromEntity({
    required BookSearchResultEntity entity,
  }) =>
      SearchResultModel(
        searchedBookList: List<BookModel>.generate(
          entity.contents.length,
          (int index) => BookModel.fromEntity(
            entity: entity.contents[index],
          ),
        ),
        currentPage: entity.pageable.page,
        totalPages: entity.pageable.totalPages,
        totalElements: entity.pageable.totalElements,
        isEnd: entity.pageable.isEnd,
      );

  @override
  List<Object?> get props => <Object?>[
        searchedBookList,
        currentPage,
        totalPages,
        isEnd,
      ];
}
