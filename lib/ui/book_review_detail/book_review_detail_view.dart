import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/booklog_colors.dart';
import '../../theme/typographies.dart';
import '../common/app_bar/reverse_rounded_app_bar.dart';
import '../common/consts/assets.dart';

class BookReviewDetailView extends StatelessWidget {
  const BookReviewDetailView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const ReverseRoundedAppBar(),
        persistentFooterAlignment: AlignmentDirectional.centerStart,
        bottomNavigationBar: Container(
          height: 48,
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: BooklogColors.gray1)),
            color: BooklogColors.white,
          ),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 22),
            child: SizedBox(
              height: 30,
              width: 30,
              child: IconButton(
                padding: EdgeInsets.zero,
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.back,
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    BooklogColors.gray2,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
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
                      const SizedBox(height: 45),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            Assets.thumnail,
                            width: 80,
                            height: 80,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '생의 외침 속에서 찾는 진정한 나',
                                  style: Typo.h24Sb.copyWith(fontSize: 16),
                                ),
                                const SizedBox(height: 12),
                                Text.rich(
                                  TextSpan(
                                      text: '시대예보 호명사회',
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: ' 을 읽고',
                                          style: Typo.c12r.copyWith(
                                            color: BooklogColors.black,
                                          ),
                                        )
                                      ]),
                                  style: Typo.c12r.copyWith(
                                    color: BooklogColors.main,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '홍길동',
                                      style: Typo.c12r.copyWith(fontSize: 11),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      height: 2,
                                      width: 2,
                                      decoration: BoxDecoration(
                                        color: BooklogColors.gray2,
                                        borderRadius: BorderRadius.circular(1),
                                      ),
                                    ),
                                    Text(
                                      '2024년 10월 3일',
                                      style: Typo.c12r.copyWith(
                                        fontSize: 11,
                                        color: BooklogColors.gray2,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              style: const ButtonStyle(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              constraints: const BoxConstraints(),
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                Assets.verticalDots,
                                width: 3,
                                height: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: BooklogColors.gray1,
                        height: 33,
                      ),
                      const Text('''
『모순』의 첫 번째 장인 "생의 외침"은 주인공 안진진의 복잡한 내면을 탐구하는 출발점이다.
그녀는 억척스런 어머니와 가끔씩 돌아오는 아버지, 조폭의 보스를 꿈꾸는 남동생과 함께 복잡하고 모순된 가족 안에서 성장했다. 

그들의 삶 속에서 진진은 자신의 존재에 대한 끊임없는 의문을 품는다. "나는 누구인가?"라는 질문은 어머니와 이모의 대조적인 삶을 바라보며 더욱 깊어진다.

이 장에서 진진은 생의 소란과 복잡함 속에서 진정한 자신의 목소리를 찾고자 한다. 삶은 끊임없이 외치고, 주변의 기대와 현실의 압박은 그녀를 혼란스럽게 한다. 하지만 이 외침 속에서도 진진은 자신만의 의미를 찾기 위해 노력한다. 이는 우리 모두가 삶에서 겪는 고민이기도 하다. 우리는 일상 속에서 끊임없이 외부의 요구와 내면의 갈등 속에서 자신의 정체성을 탐구하고, 진정한 나를 찾기 위한 여정을 떠난다.

"생의 외침"은 우리에게 질문을 던진다. 수많은 소음과 혼란 속에서 나의 목소리는 어디에 있는가? 나는 내 삶을 주도하고 있는가? 이 장은 그저 안진진의 이야기가 아니라, 우리 모두가 겪고 있는 모순된 인생에 대한 성찰의 기회를 제공한다.
진진의 내면적 갈등은 우리가 일상에서 느끼는 무력감과 닮아 있다. 생의 소란과 혼돈 속에서 나를 찾는 여정은 쉽지 않지만, 그 과정에서 우리는 조금씩 나아가고 있다는 것을 깨닫게 한다.'''),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
