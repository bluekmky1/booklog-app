import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/common/repository/repository.dart';
import '../../core/common/repository/repository_result.dart';
import 'book_remote_data_source.dart';
import 'entity/book_entity.dart';
import 'entity/book_search_result_entity.dart';
import 'entity/book_title_entity.dart';
import 'entity/user_book_activity_entity.dart';

final Provider<BookRepository> bookRepositoryProvider =
    Provider<BookRepository>(
  (ProviderRef<BookRepository> ref) =>
      BookRepository(ref.watch(bookRemoteDataSourceProvider)),
);

class BookRepository extends Repository {
  const BookRepository(this._bookRemoteDataSource);

  final BookRemoteDataSource _bookRemoteDataSource;

  // 기본 도서 목록 조회
  Future<RepositoryResult<List<BookEntity>>> getBookList({
    required int size,
  }) async {
    try {
      return SuccessRepositoryResult<List<BookEntity>>(
        data: await _bookRemoteDataSource.getBookList(
          size: size,
        ),
      );
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;

      return switch (statusCode) {
        _ => FailureRepositoryResult<List<BookEntity>>(
            error: e,
            messages: <String>['데이터 불러오는 과정에 오류가 있습니다'],
          ),
      };
    }
  }

  // isbn에 해당하는 도서 ID 반환
  Future<RepositoryResult<BookTitleEntity>> getBookByIsbn({
    required String isbn,
  }) async {
    try {
      return SuccessRepositoryResult<BookTitleEntity>(
        data: await _bookRemoteDataSource.getBookByIsbn(
          isbn: isbn,
        ),
      );
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;

      return switch (statusCode) {
        _ => FailureRepositoryResult<BookTitleEntity>(
            error: e,
            messages: <String>['데이터 불러오는 과정에 오류가 있습니다'],
          ),
      };
    }
  }

  // 내 활동 내역 조회
  Future<RepositoryResult<UserBookActivityEntity>> getMyBookActivity() async {
    try {
      return SuccessRepositoryResult<UserBookActivityEntity>(
        data: await _bookRemoteDataSource.getMyBookActivity(),
      );
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;

      return switch (statusCode) {
        _ => FailureRepositoryResult<UserBookActivityEntity>(
            error: e,
            messages: <String>['데이터 불러오는 과정에 오류가 있습니다'],
          ),
      };
    }
  }

  // 도서 검색
  Future<RepositoryResult<BookSearchResultEntity>> searchBook({
    required String keyword,
    required int size,
    required int page,
  }) async {
    try {
      return SuccessRepositoryResult<BookSearchResultEntity>(
        data: await _bookRemoteDataSource.searchBook(
          keyword: keyword,
          size: size,
          page: page,
        ),
      );
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;

      return switch (statusCode) {
        _ => FailureRepositoryResult<BookSearchResultEntity>(
            error: e,
            messages: <String>['데이터 불러오는 과정에 오류가 있습니다'],
          ),
      };
    }
  }
}
