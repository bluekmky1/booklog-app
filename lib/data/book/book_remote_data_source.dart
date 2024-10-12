import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../service/network/dio_service.dart';
import 'entity/book_entity.dart';
import 'entity/book_search_result_entity.dart';
import 'entity/book_title_entity.dart';
import 'entity/user_book_activity_entity.dart';

part 'generated/book_remote_data_source.g.dart';

final Provider<BookRemoteDataSource> bookRemoteDataSourceProvider =
    Provider<BookRemoteDataSource>(
  (ProviderRef<BookRemoteDataSource> ref) =>
      BookRemoteDataSource(ref.read(dioServiceProvider)),
);

@RestApi()
abstract class BookRemoteDataSource {
  factory BookRemoteDataSource(Dio dio) = _BookRemoteDataSource;

  @GET('/book')
  Future<List<BookEntity>> getBookList({
    @Query('size') required int size,
  });

  @GET('/book/{isbn}')
  Future<BookTitleEntity> getBookByIsbn({
    @Path('isbn') required String isbn,
  });

  @GET('/books/me')
  Future<UserBookActivityEntity> getMyBookActivity();

  @GET('/books/search')
  Future<BookSearchResultEntity> searchBook({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('keyword') required String keyword,
  });
}
