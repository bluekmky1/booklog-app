import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../service/network/dio_service.dart';
import 'entity/review_entity.dart';
import 'entity/review_id_entity.dart';

part 'generated/review_remote_data_source.g.dart';

final Provider<ReviewRemoteDataSource> reviewRemoteDataSourceProvider =
    Provider<ReviewRemoteDataSource>(
  (ProviderRef<ReviewRemoteDataSource> ref) =>
      ReviewRemoteDataSource(ref.read(dioServiceProvider)),
);

@RestApi()
abstract class ReviewRemoteDataSource {
  factory ReviewRemoteDataSource(Dio dio) = _ReviewRemoteDataSource;

  // 독후감 생성
  @POST('/reviews')
  @MultiPart()
  Future<ReviewIdEntity> postReview({
    @Part(contentType: 'image/png') required File file,
    @Part() required String title,
    @Part() required String content,
    @Part() required int bookId,
  });

  // 독후감 상세 조회
  @GET('/reviews/{reviewId}')
  Future<List<ReviewEntity>> getReviewDetail({
    @Path('reviewId') required int reviewId,
  });

  // 독후감 수정
  @PATCH('/reviews/{reviewId}')
  @MultiPart()
  Future<List<ReviewEntity>> patchReview({
    @Path('reviewId') required int reviewId,
    @Part(contentType: 'image/png') required File file,
    @Part() required String title,
    @Part() required String content,
    @Part() required int bookId,
  });

  // 독후감 삭제
  @PATCH('/reviews/{reviewId}')
  Future<void> deleteReview({
    @Path('reviewId') required int reviewId,
  });

  // 특정 도서에 대한 독후감 리스트 조회
  @GET('/reviews/list/{bookId}')
  Future<List<ReviewEntity>> getReviewListByReviewId({
    @Path('bookId') required int bookId,
  });
}
