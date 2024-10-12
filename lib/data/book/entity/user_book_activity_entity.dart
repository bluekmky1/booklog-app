import 'package:json_annotation/json_annotation.dart';

import 'book_entity.dart';

part 'generated/user_book_activity_entity.g.dart';

@JsonSerializable()
class UserBookActivityEntity {
  const UserBookActivityEntity({
    required this.userId,
    required this.userName,
    required this.bookCount,
    required this.revuewCount,
    required this.bookResponses,
  });

  final String userId;
  final String userName;
  final int bookCount;
  final int revuewCount;
  final List<BookEntity> bookResponses;

  factory UserBookActivityEntity.fromJson(Map<String, dynamic> json) =>
      _$UserBookActivityEntityFromJson(json);
}
