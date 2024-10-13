import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/loading_status.dart';
import '../../domain/book/model/book_model.dart';
import '../../routes/routes.dart';
import '../../theme/booklog_colors.dart';
import '../../theme/typographies.dart';
import '../common/app_bar/reverse_rounded_app_bar.dart';
import '../common/consts/assets.dart';
import '../common/inputs/search_input_widget.dart';
import 'home_state.dart';
import 'home_view_model.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView>
    with WidgetsBindingObserver {
  TextEditingController searchcontroller = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeViewModelProvider.notifier).init();
    });

    WidgetsBinding.instance.addObserver(this);
    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0 &&
          ref.read(
            homeViewModelProvider.select((HomeState value) => !value.isEnd),
          ) &&
          ref.read(
            homeViewModelProvider
                .select((HomeState value) => value.searchKeyword.isNotEmpty),
          )) {
        ref.read(homeViewModelProvider.notifier).loadSearchBook();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeState state = ref.watch(homeViewModelProvider);
    final HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);
    return Scaffold(
      appBar: const ReverseRoundedAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: BooklogColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: state.getRandomBookListLoadingStatus ==
                      LoadingStatus.loading
                  ? const Column(
                      children: <Widget>[
                        Expanded(
                            child: Center(
                                child: CircularProgressIndicator(
                          color: BooklogColors.main,
                        ))),
                      ],
                    )
                  : SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 28),
                          Text(
                            'Booklog',
                            style: Typo.st32r.copyWith(
                              color: BooklogColors.main,
                              fontSize: 36,
                              fontFamily: 'ROCK',
                            ),
                          ),
                          Text(
                            'join our community and share your book reviews.',
                            style: Typo.c12r.copyWith(
                              color: BooklogColors.gray2,
                              fontFamily: 'ROCK',
                            ),
                          ),
                          const SizedBox(height: 35),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: SearchInputWidget(
                              onSearch: () {
                                viewModel.onchangeSearchKeyword(
                                  searchcontroller.text,
                                );
                                FocusScope.of(context).unfocus();
                              },
                              textEditingController: searchcontroller,
                              onClear: () {
                                viewModel.onchangeSearchKeyword('');
                              },
                              onEditingComplete: () {
                                viewModel.onchangeSearchKeyword(
                                  searchcontroller.text,
                                );
                                FocusScope.of(context).unfocus();
                              },
                              onChanged: (String value) {
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(height: 48),
                          Builder(
                            builder: (BuildContext context) {
                              // 검색어가 없을 때 초기 화면 빌드
                              if (state.searchKeyword.isEmpty) {
                                // 초기 화면
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Row(
                                    children: <Widget>[
                                      Text.rich(
                                        TextSpan(
                                          text: '지금 독자들이\n',
                                          style: Typo.h24Sb,
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '가장 많이 이야기하는 책',
                                              style: Typo.h24Sb.copyWith(
                                                color: BooklogColors.point,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }

                              if (state.searchBookLoadingStatus ==
                                  LoadingStatus.loading) {
                                return const Padding(
                                  padding: EdgeInsets.only(top: 100),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: BooklogColors.main,
                                    ),
                                  ),
                                );
                              }

                              // 검색어가 있을 경우
                              // 검색 결과가 비어있는 경우
                              if (state.searchedBookList.isEmpty) {
                                return Column(
                                  children: <Widget>[
                                    SearchResultStatusBar(
                                      searchKeyword: state.searchKeyword,
                                      totalElements: state.totalElements,
                                    ),
                                    // 검색 결과 없을 때
                                    const SizedBox(height: 100),
                                    Image.asset(Assets.emptySpace1,
                                        height: 231),
                                    const SizedBox(height: 24),
                                    Text(
                                      '아쉽지만 해당 책을 찾을 수 없었어요.',
                                      style: Typo.c12r
                                          .copyWith(color: BooklogColors.gray2),
                                    ),
                                    Text(
                                      '다른 검색어를 입력해보세요.',
                                      style: Typo.c12r
                                          .copyWith(color: BooklogColors.gray2),
                                    ),
                                    const SizedBox(height: 84),
                                  ],
                                );
                              } else {
                                return Column(
                                  children: <Widget>[
                                    SearchResultStatusBar(
                                      searchKeyword: state.searchKeyword,
                                      totalElements: state.totalElements,
                                    ),
                                    const SizedBox(height: 32),
                                    BookList(bookList: state.searchedBookList),
                                  ],
                                );
                              }
                            },
                          ),
                          if (state.searchBookLoadingStatus !=
                              LoadingStatus.loading)
                            // 책 리스트
                            if (state.searchKeyword.isEmpty)
                              Column(
                                children: <Widget>[
                                  const SizedBox(height: 30),
                                  BookList(bookList: state.randomBookList)
                                ],
                              ),
                          const SizedBox(height: 84),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookList extends StatelessWidget {
  const BookList({
    required this.bookList,
    super.key,
  });

  final List<BookModel> bookList;

  @override
  Widget build(BuildContext context) => GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 95 / 167,
        mainAxisSpacing: 20,
        crossAxisSpacing: 14,
      ),
      itemBuilder: (BuildContext context, int index) => BookContainerWidget(
          onTap: () {
            context.goNamed(Routes.bookReviewList.name);
          },
          title: bookList[index].title,
          imageUrl: bookList[index].coverImageUrl),
      itemCount: bookList.length);
}

class SearchResultStatusBar extends StatelessWidget {
  const SearchResultStatusBar({
    required this.searchKeyword,
    required this.totalElements,
    super.key,
  });

  final String searchKeyword;
  final int totalElements;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              searchKeyword,
              style: Typo.h24Sb,
            ),
            const SizedBox(width: 8),
            Text(
              '검색 결과',
              style: Typo.b16r.copyWith(height: 2),
            ),
            const SizedBox(width: 4),
            Text(
              '$totalElements건',
              style: Typo.b16r.copyWith(
                color: BooklogColors.point,
                height: 2,
              ),
            ),
          ],
        ),
      );
}

class BookContainerWidget extends StatelessWidget {
  const BookContainerWidget({
    required this.imageUrl,
    required this.title,
    this.onTap,
    super.key,
  });

  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                color: BooklogColors.white,
                borderRadius: BorderRadius.circular(5.23),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 5,
                    color: BooklogColors.deepGray.withOpacity(0.2),
                  )
                ],
              ),
              child: Image.network(
                imageUrl,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Typo.c12r,
          )
        ],
      );
}
