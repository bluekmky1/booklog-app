import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/common/repository/repository.dart';
import '../../core/common/repository/repository_result.dart';
import 'entity/review_entity.dart';
import 'entity/review_id_entity.dart';
import 'review_remote_data_source.dart';

final Provider<ReviewRepository> reviewRepositoryProvider =
    Provider<ReviewRepository>(
  (ProviderRef<ReviewRepository> ref) =>
      ReviewRepository(ref.watch(reviewRemoteDataSourceProvider)),
);

class ReviewRepository extends Repository {
  const ReviewRepository(this._reviewRemoteDataSource);

  final ReviewRemoteDataSource _reviewRemoteDataSource;

  // 독후감 생성
  Future<RepositoryResult<ReviewIdEntity>> getReviewList({
    required File file,
    required String title,
    required String content,
    required int bookId,
  }) async {
    try {
      return SuccessRepositoryResult<ReviewIdEntity>(
        data: await _reviewRemoteDataSource.postReview(
          file: file,
          title: title,
          content: content,
          bookId: bookId,
        ),
      );
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;

      return switch (statusCode) {
        _ => FailureRepositoryResult<ReviewIdEntity>(
            error: e,
            messages: <String>['독후감을 생성하지 못했습니다.'],
          ),
      };
    }
  }

  // 독후감 조회
  Future<RepositoryResult<List<ReviewEntity>>> getReviewDetail({
    required int reviewId,
  }) async {
    try {
      return SuccessRepositoryResult<List<ReviewEntity>>(
        data: await _reviewRemoteDataSource.getReviewDetail(reviewId: reviewId),
      );
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;

      return switch (statusCode) {
        _ => FailureRepositoryResult<List<ReviewEntity>>(
            error: e,
            messages: <String>['독후감을 불러오는 과정에 오류가 있습니다'],
          ),
      };
    }
  }

  // 독후감 수정
  Future<RepositoryResult<List<ReviewEntity>>> patchReview({
    required int reviewId,
    required File file,
    required String title,
    required String content,
    required int bookId,
  }) async {
    try {
      return SuccessRepositoryResult<List<ReviewEntity>>(
        data: await _reviewRemoteDataSource.patchReview(
          reviewId: reviewId,
          file: file,
          title: title,
          content: content,
          bookId: bookId,
        ),
      );
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;

      return switch (statusCode) {
        _ => FailureRepositoryResult<List<ReviewEntity>>(
            error: e,
            messages: <String>['독후감을 수정하는 과정에 오류가 있습니다'],
          ),
      };
    }
  }

  // 독후감 삭제
  Future<RepositoryResult<void>> searchReview({
    required int reviewId,
  }) async {
    try {
      await _reviewRemoteDataSource.deleteReview(reviewId: reviewId);
      return const SuccessRepositoryResult<void>(data: null);
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;

      return switch (statusCode) {
        _ => FailureRepositoryResult<void>(
            error: e,
            messages: <String>['독후감을 삭제하는 과정에 오류가 있습니다'],
          ),
      };
    }
  }

  // 특정 책에 대한 독후감 리스트 조회
  Future<RepositoryResult<List<ReviewEntity>>> getMyReviewActivity({
    required int bookId,
  }) async {
    try {
      return SuccessRepositoryResult<List<ReviewEntity>>(
        data: await _reviewRemoteDataSource.getReviewListByReviewId(
          bookId: bookId,
        ),
      );
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;

      return switch (statusCode) {
        _ => FailureRepositoryResult<List<ReviewEntity>>(
            error: e,
            messages: <String>['독후감 리스트를 불러오는 과정에 오류가 있습니다'],
          ),
      };
    }
  }
}
