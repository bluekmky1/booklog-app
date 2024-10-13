import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../routes/routes.dart';
import '../../theme/booklog_colors.dart';
import '../../theme/typographies.dart';
import '../common/app_bar/reverse_rounded_app_bar.dart';
import '../common/buttons/filled_text_button_widget.dart';
import '../common/buttons/outlined_text_button_widget.dart';
import '../common/consts/assets.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  @override
  Widget build(BuildContext context) => Scaffold(
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
                            Text(
                              'Welcome to\nBooklog!',
                              style: Typo.st32r.copyWith(
                                fontFamily: 'ROCK',
                                fontSize: 36,
                                height: 1.15,
                                color: BooklogColors.main,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'join our community and share your book reviews.',
                              style: Typo.c12r.copyWith(
                                fontFamily: 'ROCK',
                                height: 1.15,
                                color: BooklogColors.gray2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        blurRadius: 2.5,
                        offset: const Offset(0, -5),
                        color: BooklogColors.deepGray.withOpacity(0.1)),
                  ],
                  color: BooklogColors.white,
                ),
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '로그인',
                      style: Typo.h24Sb.copyWith(
                        color: BooklogColors.main,
                      ),
                    ),
                    const SignInInputWidget(
                      hintText: '아이디를 입력해 주세요',
                      iconUrl: Assets.userInfo,
                    ),
                    const SignInInputWidget(
                      hintText: '영문+숫자 8자리 이상의 비밀번호를 입력해주세요',
                      isObscureText: true,
                      prefixLeftPadding: 8,
                      iconUrl: Assets.lock,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 4),
                      child:
                          // SizedBox(height: 20),
                          Text(
                        '아이디 또는 비밀번호를 다시 확인하세요.',
                        style: Typo.c12r.copyWith(color: BooklogColors.point),
                      ),
                    ),
                    const SizedBox(height: 40),
                    FilledTextButtonWidget(
                      text: '로그인',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 8),
                    OutlinedTextButtonWidget(
                      text: '회원가입',
                      onPressed: () {
                        context.goNamed(Routes.signUp.name);
                      },
                    ),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () {
                        context.goNamed(Routes.home.name);
                      },
                      icon: SvgPicture.asset(
                        Assets.back,
                        colorFilter: const ColorFilter.mode(
                          BooklogColors.main,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: Text(
                        '홈으로',
                        style: Typo.c12r.copyWith(
                          color: BooklogColors.main,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

class SignInInputWidget extends StatelessWidget {
  const SignInInputWidget({
    required this.iconUrl,
    required this.hintText,
    super.key,
    this.isObscureText = false,
    this.prefixLeftPadding = 4,
  });
  final String iconUrl;
  final String hintText;
  final bool isObscureText;
  final double prefixLeftPadding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: TextField(
          cursorColor: BooklogColors.point,
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          obscureText: isObscureText,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                width: 0.5,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                width: 0.5,
              ),
            ),
            prefixIconConstraints: const BoxConstraints(),
            prefixIcon: Padding(
              padding: EdgeInsets.only(right: 16, left: prefixLeftPadding),
              child: SvgPicture.asset(
                iconUrl,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  BooklogColors.gray2,
                  BlendMode.srcIn,
                ),
              ),
            ),
            hintText: hintText,
            hintStyle: Typo.c12r.copyWith(
              color: BooklogColors.gray2,
            ),
          ),
        ),
      );
}
