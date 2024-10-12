import 'package:equatable/equatable.dart';
import '../../../../core/loading_status.dart';
import '../../domain/book/model/book_model.dart';

class HomeState extends Equatable {
  // 책 검색
  final LoadingStatus searchBookLoadingStatus;
  final String searchKeyword;
  final List<BookModel> searchedBookList;

  // 무한 스크롤
  final LoadingStatus loadSearchBookLoadingStatus;
  final int totalElements;
  final int currentPage;
  final int totalPages;
  final bool isEnd;

  // 독자들이 가장 많이 이야기하는 책 리스트
  final LoadingStatus getRandomBookListLoadingStatus;
  final List<BookModel> randomBookList;

  const HomeState({
    required this.searchBookLoadingStatus,
    required this.searchKeyword,
    required this.searchedBookList,
    required this.loadSearchBookLoadingStatus,
    required this.totalElements,
    required this.currentPage,
    required this.totalPages,
    required this.isEnd,
    required this.getRandomBookListLoadingStatus,
    required this.randomBookList,
  });

  HomeState.init()
      : searchBookLoadingStatus = LoadingStatus.none,
        searchKeyword = '',
        searchedBookList = <BookModel>[],
        loadSearchBookLoadingStatus = LoadingStatus.none,
        totalElements = 0,
        currentPage = 1,
        totalPages = 1,
        isEnd = false,
        getRandomBookListLoadingStatus = LoadingStatus.none,
        randomBookList = <BookModel>[];

  HomeState copyWith({
    LoadingStatus? searchBookLoadingStatus,
    String? searchKeyword,
    List<BookModel>? searchedBookList,
    LoadingStatus? loadSearchBookLoadingStatus,
    int? totalElements,
    int? currentPage,
    int? totalPages,
    bool? isEnd,
    LoadingStatus? getRandomBookListLoadingStatus,
    List<BookModel>? randomBookList,
  }) =>
      HomeState(
        searchBookLoadingStatus:
            searchBookLoadingStatus ?? this.searchBookLoadingStatus,
        searchKeyword: searchKeyword ?? this.searchKeyword,
        searchedBookList: searchedBookList ?? this.searchedBookList,
        loadSearchBookLoadingStatus:
            loadSearchBookLoadingStatus ?? this.loadSearchBookLoadingStatus,
        totalElements: totalElements ?? this.totalElements,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        isEnd: isEnd ?? this.isEnd,
        getRandomBookListLoadingStatus: getRandomBookListLoadingStatus ??
            this.getRandomBookListLoadingStatus,
        randomBookList: randomBookList ?? this.randomBookList,
      );

  @override
  List<Object> get props => <Object>[
        searchBookLoadingStatus,
        searchKeyword,
        searchedBookList,
        loadSearchBookLoadingStatus,
        totalElements,
        currentPage,
        totalPages,
        isEnd,
        getRandomBookListLoadingStatus,
        randomBookList,
      ];
}
