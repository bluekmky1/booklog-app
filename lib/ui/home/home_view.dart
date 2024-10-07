import 'package:flutter/material.dart';

import '../../theme/booklog_colors.dart';
import '../../theme/typographies.dart';
import '../common/app_bar/reverse_rounded_app_bar.dart';
import '../common/consts/assets.dart';
import '../common/inputs/search_input_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
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
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 28),
                      Text(
                        'Booklog',
                        style: Typo.st32r.copyWith(
                          color: BooklogColors.main,
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
                          textEditingController: searchcontroller,
                          onChanged: (String value) {},
                        ),
                      ),
                      const SizedBox(height: 64),

                      // 초기 화면
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 24),
                      //   child: Row(
                      //     children: <Widget>[
                      //       Text.rich(
                      //         TextSpan(
                      //           text: '지금 독자들이\n',
                      //           style: Typo.h24Sb,
                      //           children: <InlineSpan>[
                      //             TextSpan(
                      //               text: '가장 많이 이야기하는 책',
                      //               style: Typo.h24Sb.copyWith(
                      //                 color: BooklogColors.point,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      // 검색 결과 있을 때
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            const Text(
                              '모순',
                              style: Typo.h24Sb,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '검색 결과',
                              style: Typo.b16r.copyWith(height: 2),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '0건',
                              style: Typo.b16r.copyWith(
                                color: BooklogColors.point,
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 검색 결과 없을 때
                      const SizedBox(height: 100),
                      Image.asset(Assets.emptySpace1, height: 231),
                      const SizedBox(height: 24),
                      Text(
                        '아쉽지만 해당 책을 찾을 수 없었어요.',
                        style: Typo.c12r.copyWith(color: BooklogColors.gray2),
                      ),
                      Text(
                        '다른 검색어를 입력해보세요.',
                        style: Typo.c12r.copyWith(color: BooklogColors.gray2),
                      ),
                      const SizedBox(height: 84),

                      // 책 리스트
                      // const SizedBox(height: 30),
                      // GridView.builder(
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                      //   padding: const EdgeInsets.symmetric(horizontal: 24),
                      //   gridDelegate:
                      //       const SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 3,
                      //     childAspectRatio: 95 / 167,
                      //     mainAxisSpacing: 20,
                      //     crossAxisSpacing: 14,
                      //   ),
                      //   itemBuilder: (BuildContext context, int index) =>
                      //       BookContainerWidget(
                      //     assetUrl:
                      //         'assets/mock_images/book${index % 3 + 1}.png',
                      //   ),
                      //   itemCount: 7,
                      // ),
                      // const SizedBox(height: 84),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class BookContainerWidget extends StatelessWidget {
  const BookContainerWidget({
    required this.assetUrl,
    super.key,
  });

  final String assetUrl;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.23),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 5,
                  color: BooklogColors.deepGray.withOpacity(0.2),
                )
              ],
            ),
            clipBehavior: Clip.hardEdge,
            // width: 95,
            // height: 140,
            child: Image.asset(assetUrl),
          ),
          const SizedBox(height: 8),
          const Text(
            '시대예보 : 호명사회',
            style: Typo.c12r,
          )
        ],
      );
}
