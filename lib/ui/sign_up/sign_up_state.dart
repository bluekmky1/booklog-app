import 'package:equatable/equatable.dart';
import '../../../../core/loading_status.dart';
import '../../domain/book/model/book_model.dart';

class SignUpState extends Equatable {
  final String errorMsg;

  // 책 검색
  final String searchKeyword;
  final List<BookModel> searchedBookList;

  // 독자들이 가장 많이 이야기하는 책 리스트
  final LoadingStatus getRandomBookListLoadingStatus;
  final List<BookModel> randomBookList;

  const SignUpState({
    required this.errorMsg,
    required this.searchKeyword,
    required this.searchedBookList,
    required this.getRandomBookListLoadingStatus,
    required this.randomBookList,
  });

  SignUpState.init()
      : errorMsg = '',
        searchKeyword = '',
        searchedBookList = <BookModel>[],
        getRandomBookListLoadingStatus = LoadingStatus.none,
        randomBookList = <BookModel>[];

  SignUpState copyWith({
    String? errorMsg,
    String? searchKeyword,
    List<BookModel>? searchedBookList,
    LoadingStatus? getRandomBookListLoadingStatus,
    List<BookModel>? randomBookList,
  }) =>
      SignUpState(
        errorMsg: errorMsg ?? this.errorMsg,
        searchKeyword: searchKeyword ?? this.searchKeyword,
        searchedBookList: searchedBookList ?? this.searchedBookList,
        getRandomBookListLoadingStatus: getRandomBookListLoadingStatus ??
            this.getRandomBookListLoadingStatus,
        randomBookList: randomBookList ?? this.randomBookList,
      );

  @override
  List<Object> get props => <Object>[
        errorMsg,
        searchKeyword,
        searchedBookList,
        getRandomBookListLoadingStatus,
        randomBookList,
      ];
}
