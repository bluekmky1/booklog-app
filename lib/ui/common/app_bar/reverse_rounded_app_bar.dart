import 'package:flutter/material.dart';

import '../../../theme/booklog_colors.dart';
import '../../../theme/typographies.dart';

class ReverseRoundedAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ReverseRoundedAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            'Booklog',
            style: Typo.st32r.copyWith(
              color: BooklogColors.white,
              fontFamily: 'ROCK',
              fontSize: 16,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              '홍길동 님',
              style: Typo.c12r.copyWith(color: BooklogColors.white),
            ),
          ),
        ],
      );

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
