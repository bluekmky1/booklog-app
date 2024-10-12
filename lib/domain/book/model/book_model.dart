import 'package:equatable/equatable.dart';

import '../../../data/book/entity/book_entity.dart';

class BookModel extends Equatable {
  const BookModel({
    required this.id,
    required this.coverImageUrl,
    required this.title,
    required this.author,
    required this.description,
  });

  final int id;
  final String coverImageUrl;
  final String title;
  final String author;
  final String description;

  factory BookModel.fromEntity({
    required BookEntity entity,
  }) =>
      BookModel(
        id: entity.id,
        coverImageUrl: entity.file.physicalPath,
        title: entity.title,
        author: entity.author,
        description: entity.description,
      );

  @override
  List<Object?> get props => <Object?>[
        id,
        coverImageUrl,
        title,
        author,
        description,
      ];
}
