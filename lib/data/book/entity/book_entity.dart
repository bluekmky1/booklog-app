import 'package:json_annotation/json_annotation.dart';

part 'generated/book_entity.g.dart';

@JsonSerializable()
class BookEntity {
  const BookEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
  });

  final int id;
  final String title;
  final String author;
  final String description;

  factory BookEntity.fromJson(Map<String, dynamic> json) =>
      _$BookEntityFromJson(json);
}

@JsonSerializable()
class BookFileEntity {
  const BookFileEntity({
    required this.id,
    required this.logicalName,
    required this.physicalPath,
  });

  final int id;
  final String logicalName;
  final String physicalPath;

  factory BookFileEntity.fromJson(Map<String, dynamic> json) =>
      _$BookFileEntityFromJson(json);
}
