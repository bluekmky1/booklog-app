import 'package:json_annotation/json_annotation.dart';

import '../../../core/common/data/file_entity.dart';
import '../../../core/common/data/json_converter.dart';
import '../../book/entity/book_entity.dart';

part 'generated/review_entity.g.dart';

@JsonSerializable()
class ReviewEntity {
  const ReviewEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.name,
    required this.userId,
    required this.file,
    required this.book,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String content;
  final String name;
  final String userId;
  final FileEntity file;
  final BookEntity book;
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @DateTimeJsonConverter()
  final DateTime updatedAt;

  factory ReviewEntity.fromJson(Map<String, dynamic> json) =>
      _$ReviewEntityFromJson(json);
}
