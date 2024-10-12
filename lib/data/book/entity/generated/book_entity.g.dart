// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../book_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookEntity _$BookEntityFromJson(Map<String, dynamic> json) => BookEntity(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$BookEntityToJson(BookEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
    };

BookFileEntity _$BookFileEntityFromJson(Map<String, dynamic> json) =>
    BookFileEntity(
      id: (json['id'] as num).toInt(),
      logicalName: json['logicalName'] as String,
      physicalPath: json['physicalPath'] as String,
    );

Map<String, dynamic> _$BookFileEntityToJson(BookFileEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logicalName': instance.logicalName,
      'physicalPath': instance.physicalPath,
    };
