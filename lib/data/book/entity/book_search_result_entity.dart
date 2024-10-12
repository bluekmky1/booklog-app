import 'package:json_annotation/json_annotation.dart';

import '../../../core/common/data/pageable_entity.dart';
import 'book_entity.dart';

part 'generated/book_search_result_entity.g.dart';

@JsonSerializable()
class BookSearchResultEntity {
  const BookSearchResultEntity({
    required this.contents,
    required this.pageable,
  });

  final List<BookEntity> contents;
  final PageableEntity pageable;

  factory BookSearchResultEntity.fromJson(Map<String, dynamic> json) =>
      _$BookSearchResultEntityFromJson(json);
}
