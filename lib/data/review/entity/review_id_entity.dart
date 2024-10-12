import 'package:json_annotation/json_annotation.dart';

part 'generated/review_id_entity.g.dart';

@JsonSerializable()
class ReviewIdEntity {
  const ReviewIdEntity({
    required this.id,
  });

  final int id;

  factory ReviewIdEntity.fromJson(Map<String, dynamic> json) =>
      _$ReviewIdEntityFromJson(json);
}
