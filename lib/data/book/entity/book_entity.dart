import 'package:json_annotation/json_annotation.dart';

import '../../../core/common/data/file_entity.dart';

part 'generated/book_entity.g.dart';

@JsonSerializable()
class BookEntity {
  const BookEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.file,
  });

  final int id;
  final String title;
  final String author;
  final String description;
  final FileEntity file;

  factory BookEntity.fromJson(Map<String, dynamic> json) =>
      _$BookEntityFromJson(json);
}
