import 'package:json_annotation/json_annotation.dart';

part 'generated/book_title_entity.g.dart';

@JsonSerializable()
class BookTitleEntity {
  const BookTitleEntity({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory BookTitleEntity.fromJson(Map<String, dynamic> json) =>
      _$BookTitleEntityFromJson(json);
}
