import 'package:equatable/equatable.dart';
import '../../../../core/loading_status.dart';
import '../../domain/book/model/book_model.dart';

class SignInState extends Equatable {
  final String errorMsg;

  // 책 검색
  final String searchKeyword;
  final List<BookModel> searchedBookList;

  // 독자들이 가장 많이 이야기하는 책 리스트
  final LoadingStatus getRandomBookListLoadingStatus;
  final List<BookModel> randomBookList;

  const SignInState({
    required this.errorMsg,
    required this.searchKeyword,
    required this.searchedBookList,
    required this.getRandomBookListLoadingStatus,
    required this.randomBookList,
  });

  SignInState.init()
      : errorMsg = '',
        searchKeyword = '',
        searchedBookList = <BookModel>[],
        getRandomBookListLoadingStatus = LoadingStatus.none,
        randomBookList = <BookModel>[];

  SignInState copyWith({
    String? errorMsg,
    String? searchKeyword,
    List<BookModel>? searchedBookList,
    LoadingStatus? getRandomBookListLoadingStatus,
    List<BookModel>? randomBookList,
  }) =>
      SignInState(
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
