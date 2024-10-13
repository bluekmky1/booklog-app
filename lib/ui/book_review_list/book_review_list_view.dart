import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../routes/routes.dart';
import '../../theme/booklog_colors.dart';
import '../../theme/typographies.dart';
import '../common/app_bar/reverse_rounded_app_bar.dart';
import '../common/buttons/filled_text_button_widget.dart';
import '../common/consts/assets.dart';

class BookReviewListView extends ConsumerStatefulWidget {
  const BookReviewListView({super.key});

  @override
  ConsumerState<BookReviewListView> createState() => _BookReviewListViewState();
}

class _BookReviewListViewState extends ConsumerState<BookReviewListView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: Container(
          height: 48,
          decoration: BoxDecoration(
            color: BooklogColors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 5,
                color: BooklogColors.deepGray.withOpacity(0.2),
              )
            ],
          ),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 14),
              GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: SvgPicture.asset(Assets.back),
                  )),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: BooklogColors.white,
        appBar: const ReverseRoundedAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: ColoredBox(
                      color: BooklogColors.lightGray,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 108, 24, 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: BooklogColors.white,
                                    borderRadius: BorderRadius.circular(5.23),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        blurRadius: 5,
                                        color: BooklogColors.deepGray
                                            .withOpacity(0.2),
                                      )
                                    ],
                                  ),
                                  width: 95,
                                  height: 140,
                                ),
                                const BookInfo()
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        blurRadius: 2.5,
                        offset: const Offset(0, -5),
                        color: BooklogColors.deepGray.withOpacity(0.05)),
                  ],
                  color: BooklogColors.white,
                ),
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          '독자들의 감상평',
                          style: Typo.h24Sb,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              backgroundColor: BooklogColors.main),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                Assets.edit,
                                colorFilter: const ColorFilter.mode(
                                  BooklogColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '독후감 쓰기',
                                style: Typo.c12r.copyWith(
                                  color: BooklogColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const ReviewList(),
                    const SizedBox(height: 32),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Column(
                    //       children: <Widget>[
                    //         const SizedBox(height: 50),
                    //         SizedBox(
                    //           width: 136,
                    //           child: Image.asset(Assets.emptySpace2),
                    //         ),
                    //         const SizedBox(height: 24),
                    //         Text(
                    //           '아직 남겨진 독후감이 없습니다.\n첫번째 독후감을 남겨보세요!',
                    //           textAlign: TextAlign.center,
                    //           style: Typo.c12r.copyWith(
                    //             color: BooklogColors.gray2,
                    //           ),
                    //         ),
                    //         const SizedBox(height: 115),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

class ReviewList extends StatelessWidget {
  const ReviewList({
    super.key,
  });

  @override
  Widget build(BuildContext context) => GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 144 / 200,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {
              context.goNamed(Routes.bookReview.name);
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
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
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 150,
                    color: BooklogColors.main,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      height: 95,
                      color: BooklogColors.white,
                      child: Column(
                        children: <Widget>[
                          Text(
                            '생의 외침 속에서 찾는 진정한 나',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Typo.h24Sb.copyWith(
                              color: BooklogColors.main,
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  '마재훈',
                                  style: Typo.c12r.copyWith(
                                    color: BooklogColors.main,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  '2024.10.5.',
                                  style: Typo.c12r.copyWith(
                                    color: BooklogColors.gray2,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      itemCount: 5);
}

class BookInfo extends StatelessWidget {
  const BookInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '모순',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Typo.h24Sb.copyWith(fontSize: 16),
              ),
              const Text(
                '양귀자외 n 명',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Typo.c12r,
              ),
              const SizedBox(height: 14),
              const Text(
                '인생은 살아가면서 탐구하는 것!',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text(
                '양귀자 소설의 힘을 보여준 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Typo.c12r.copyWith(
                  color: BooklogColors.deepGray,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      );
}
