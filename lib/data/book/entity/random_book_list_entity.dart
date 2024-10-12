import 'package:json_annotation/json_annotation.dart';
import 'book_entity.dart';

part 'generated/random_book_list_entity.g.dart';

@JsonSerializable()
class RandomBookListEntity {
  const RandomBookListEntity({
    required this.contents,
  });

  final List<BookEntity> contents;

  factory RandomBookListEntity.fromJson(Map<String, dynamic> json) =>
      _$RandomBookListEntityFromJson(json);
}
