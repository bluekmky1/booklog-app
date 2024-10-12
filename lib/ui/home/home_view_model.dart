import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/use_case/use_case_result.dart';
import '../../../../core/loading_status.dart';
import '../../domain/book/model/book_model.dart';
import '../../domain/book/model/search_result_model.dart';
import '../../domain/book/use_case/get_random_book_list_use_case.dart';
import '../../domain/book/use_case/search_book_use_case.dart';
import 'home_state.dart';

final AutoDisposeStateNotifierProvider<HomeViewModel, HomeState>
    homeViewModelProvider = StateNotifierProvider.autoDispose(
  (AutoDisposeRef<HomeState> ref) => HomeViewModel(
    state: HomeState.init(),
    getRandomBookListUseCase: ref.watch(getRandomBookListUseCaseProvider),
    searchBookUseCase: ref.watch(searchBookUseCaseProvider),
  ),
);

class HomeViewModel extends StateNotifier<HomeState> {
  final GetRandomBookListUseCase _getRandomBookListUseCase;
  final SearchBookUseCase _searchBookUseCase;
  HomeViewModel({
    required HomeState state,
    required GetRandomBookListUseCase getRandomBookListUseCase,
    required SearchBookUseCase searchBookUseCase,
  })  : _getRandomBookListUseCase = getRandomBookListUseCase,
        _searchBookUseCase = searchBookUseCase,
        super(state);

  void init() {
    getOwnerDetailInfo();
  }

  Future<void> getOwnerDetailInfo() async {
    state = state.copyWith(
      getRandomBookListLoadingStatus: LoadingStatus.loading,
    );
    final UseCaseResult<List<BookModel>> result =
        await _getRandomBookListUseCase();

    switch (result) {
      case SuccessUseCaseResult<List<BookModel>>():
        state = state.copyWith(
          randomBookList: result.data,
          getRandomBookListLoadingStatus: LoadingStatus.success,
        );
      case FailureUseCaseResult<List<BookModel>>():
        state = state.copyWith(
          getRandomBookListLoadingStatus: LoadingStatus.error,
        );
    }
  }

  Future<void> searchBook({
    required String searchKeyword,
  }) async {
    state = state.copyWith(
      searchBookLoadingStatus: LoadingStatus.loading,
    );
    final UseCaseResult<SearchResultModel> result = await _searchBookUseCase(
      searchKeyword: searchKeyword,
    );

    switch (result) {
      case SuccessUseCaseResult<SearchResultModel>():
        state = state.copyWith(
          searchedBookList: result.data.searchedBookList,
          totalPages: result.data.totalPages,
          currentPage: result.data.currentPage,
          totalElements: result.data.totalElements,
          isEnd: result.data.isEnd,
          searchBookLoadingStatus: LoadingStatus.success,
        );
      case FailureUseCaseResult<SearchResultModel>():
        state = state.copyWith(
          searchBookLoadingStatus: LoadingStatus.error,
        );
    }
  }

  Future<void> loadSearchBook() async {
    // 마지막 페이지일 경우 리턴
    if (state.isEnd) {
      return;
    }

    if (state.loadSearchBookLoadingStatus == LoadingStatus.loading) {
      return;
    }

    state = state.copyWith(
      loadSearchBookLoadingStatus: LoadingStatus.loading,
    );

    final UseCaseResult<SearchResultModel> result = await _searchBookUseCase(
      searchKeyword: state.searchKeyword,
      page: state.currentPage + 1,
    );

    switch (result) {
      case SuccessUseCaseResult<SearchResultModel>():
        final List<BookModel> newSearchedBookList = <BookModel>[
          ...state.searchedBookList,
          ...result.data.searchedBookList,
        ];
        state = state.copyWith(
          searchedBookList: newSearchedBookList,
          totalPages: result.data.totalPages,
          currentPage: result.data.currentPage,
          isEnd: result.data.isEnd,
          loadSearchBookLoadingStatus: LoadingStatus.success,
        );
      case FailureUseCaseResult<SearchResultModel>():
        state = state.copyWith(
          loadSearchBookLoadingStatus: LoadingStatus.error,
        );
    }
  }

  void onchangeSearchKeyword(String searchKeyword) {
    if (searchKeyword == state.searchKeyword) {
      return;
    }

    state = state.copyWith(searchKeyword: searchKeyword);

    if (searchKeyword == '') {
      state = state.copyWith(
        totalPages: 1,
        currentPage: 1,
        isEnd: false,
      );
      return;
    }

    searchBook(searchKeyword: searchKeyword);
  }

  // Future<void> getCsCategoryList() async {
  //   state = state.copyWith(
  //     getCsCategoryLoadingStatus: LoadingStatus.loading,
  //     errorMsg: '',
  //   );
  //   final UseCaseResult<List<CsCategoryModel>> result =
  //       await _getCsCategoryListUseCase();

  //   switch (result) {
  //     case SuccessUseCaseResult<List<CsCategoryModel>>():
  //       state = state.copyWith(
  //         csCategoryList: result.data,
  //         getCsCategoryLoadingStatus: LoadingStatus.success,
  //       );
  //     case FailureUseCaseResult<List<CsCategoryModel>>():
  //       state = state.copyWith(
  //         getCsCategoryLoadingStatus: LoadingStatus.error,
  //         errorMsg: result.message,
  //       );
  //   }
  // }

  // void setCategoryFilter(String categoryFilter) {
  //   state = state.copyWith(categoryFilter: categoryFilter);
  // }

  // void setAnsweredFilter(String answeredFilter) {
  //   state = state.copyWith(answeredFilter: answeredFilter);
  // }
}
