import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../theme/booklog_colors.dart';
import '../../theme/typographies.dart';
import '../common/app_bar/reverse_rounded_app_bar.dart';
import '../common/buttons/filled_text_button_widget.dart';
import '../common/consts/assets.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
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
                      '회원가입',
                      style: Typo.h24Sb.copyWith(
                        color: BooklogColors.main,
                      ),
                    ),
                    const SizedBox(height: 40),
                    SignUpInputWidget(
                      label: '아이디',
                      hintText: '아이디를 입력해 주세요',
                      explainText: '4-16자의 영문 소문자 혹은 영문+숫자를 입력해 주세요.',
                      stuffix: SizedBox(
                        width: 56,
                        height: 24,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              padding: EdgeInsets.zero,
                              backgroundColor: BooklogColors.main),
                          onPressed: () {},
                          child: Text(
                            '중복확인',
                            style: Typo.c12r.copyWith(
                              fontSize: 10,
                              color: BooklogColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const SignUpInputWidget(
                      label: '비밀번호',
                      hintText: '비밀번호를 입력해주세요',
                      explainText: '영문+숫자 8자리 이상의 비밀번호를 입력해 주세요',
                      isObscureText: true,
                    ),
                    const SizedBox(height: 24),
                    const SignUpInputWidget(
                      label: '비밀번호 확인',
                      hintText: '비밀번호를 입력해주세요',
                      isObscureText: true,
                    ),
                    const SizedBox(height: 40),
                    const FilledTextButtonWidget(text: '회원가입'),
                    const SizedBox(height: 8),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () {
                        context.pop();
                      },
                      icon: SvgPicture.asset(
                        Assets.back,
                        colorFilter: const ColorFilter.mode(
                          BooklogColors.main,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: Text(
                        '돌아가기',
                        style: Typo.c12r.copyWith(
                          color: BooklogColors.main,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32)
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

class SignUpInputWidget extends StatelessWidget {
  const SignUpInputWidget({
    required this.label,
    required this.hintText,
    super.key,
    this.errorText,
    this.explainText,
    this.isObscureText = false,
    this.prefixLeftPadding = 4,
    this.stuffix,
  });
  final String label;
  final String hintText;
  final String? errorText;
  final String? explainText;
  final bool isObscureText;
  final double prefixLeftPadding;
  final Widget? stuffix;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: Typo.b16r),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
              cursorColor: BooklogColors.point,
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              obscureText: isObscureText,
              decoration: InputDecoration(
                suffix: stuffix,
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
                hintText: hintText,
                hintStyle: Typo.c12r.copyWith(
                  color: BooklogColors.gray2,
                ),
              ),
            ),
          ),
          if (explainText != null)
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  width: 2,
                  height: 2,
                  color: BooklogColors.gray2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: Text(
                    explainText ?? '',
                    style: Typo.c12r.copyWith(color: BooklogColors.gray2),
                  ),
                ),
              ],
            ),
          if (errorText != null)
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  width: 2,
                  height: 2,
                  color: BooklogColors.point,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: Text(
                    errorText ?? '',
                    style: Typo.c12r.copyWith(color: BooklogColors.point),
                  ),
                ),
              ],
            ),
        ],
      );
}
