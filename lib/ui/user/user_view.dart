import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/booklog_colors.dart';
import '../../theme/typographies.dart';
import '../common/app_bar/reverse_rounded_app_bar.dart';
import '../common/consts/assets.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 54),
                      const Text('홍길동', style: Typo.h24Sb),
                      const SizedBox(height: 12),
                      Text.rich(
                        TextSpan(text: '지금까지 ', children: <InlineSpan>[
                          TextSpan(
                            text: '4권',
                            style: Typo.c12r.copyWith(
                              color: BooklogColors.point,
                            ),
                          ),
                          const TextSpan(text: '의 책을 읽고 '),
                          TextSpan(
                            text: '10개',
                            style: Typo.c12r.copyWith(
                              color: BooklogColors.point,
                            ),
                          ),
                          const TextSpan(text: '의 독후감을 작성했어요.'),
                        ]),
                        style: Typo.c12r,
                      ),
                      const Divider(
                        color: BooklogColors.gray1,
                        height: 65,
                      ),

                      // 검색 결과 있을 때
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          const Text(
                            '내가 읽은 책',
                            style: Typo.h24Sb,
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: BooklogColors.main,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  Assets.edit,
                                  width: 12,
                                  height: 12,
                                  colorFilter: const ColorFilter.mode(
                                    BooklogColors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '독후감 쓰기',
                                  style: Typo.c12r.copyWith(
                                    color: BooklogColors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      // 검색 결과 없을 때
                      // Align(
                      //   child: Column(
                      //     children: <Widget>[
                      //       const SizedBox(height: 100),
                      //       Image.asset(Assets.emptySpace4, height: 231),
                      //       const SizedBox(height: 24),
                      //       Text(
                      //         '아직 남긴 독후감이 없습니다.',
                      //         style: Typo.b16r
                      //             .copyWith(color: BooklogColors.gray2),
                      //       ),
                      //       Text(
                      //         '책을 읽고 감상을 공유해보세요.',
                      //         style: Typo.b16r
                      //             .copyWith(color: BooklogColors.gray2),
                      //       ),
                      //       const SizedBox(height: 84),
                      //     ],
                      //   ),
                      // ),

                      // // 책 리스트
                      // const SizedBox(height: 24),
                      // GridView.builder(
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
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
