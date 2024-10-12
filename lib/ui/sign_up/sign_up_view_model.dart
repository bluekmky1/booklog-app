import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/use_case/use_case_result.dart';
import '../../../../core/loading_status.dart';
import '../../domain/book/model/book_model.dart';
import '../../domain/book/use_case/get_random_book_list_use_case.dart';
import 'sign_up_state.dart';

final AutoDisposeStateNotifierProvider<SignUpViewModel, SignUpState>
    signInViewModelProvider = StateNotifierProvider.autoDispose(
  (AutoDisposeRef<SignUpState> ref) => SignUpViewModel(
    state: SignUpState.init(),
    getRandomBookListUseCase: ref.watch(getRandomBookListUseCaseProvider),
  ),
);

class SignUpViewModel extends StateNotifier<SignUpState> {
  final GetRandomBookListUseCase _getRandomBookListUseCase;
  SignUpViewModel({
    required SignUpState state,
    required GetRandomBookListUseCase getRandomBookListUseCase,
  })  : _getRandomBookListUseCase = getRandomBookListUseCase,
        super(state);

  void init() {
    getOwnerDetailInfo();
  }

  Future<void> getOwnerDetailInfo() async {
    state = state.copyWith(
      getRandomBookListLoadingStatus: LoadingStatus.loading,
      errorMsg: '',
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
          errorMsg: result.message,
        );
    }
  }

  void onchangeSearchKeyword(String searchKeyword) {
    state = state.copyWith(searchKeyword: searchKeyword);
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
