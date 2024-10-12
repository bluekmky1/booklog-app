// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../review_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewEntity _$ReviewEntityFromJson(Map<String, dynamic> json) => ReviewEntity(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      name: json['name'] as String,
      userId: json['userId'] as String,
      file: FileEntity.fromJson(json['file'] as Map<String, dynamic>),
      book: BookEntity.fromJson(json['book'] as Map<String, dynamic>),
      createdAt:
          const DateTimeJsonConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const DateTimeJsonConverter().fromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ReviewEntityToJson(ReviewEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'name': instance.name,
      'userId': instance.userId,
      'file': instance.file,
      'book': instance.book,
      'createdAt': const DateTimeJsonConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeJsonConverter().toJson(instance.updatedAt),
    };
