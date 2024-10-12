import 'package:flutter/material.dart';

import '../../../theme/booklog_colors.dart';
import '../../../theme/typographies.dart';

class FilledTextButtonWidget extends StatelessWidget {
  const FilledTextButtonWidget({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 48,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(8),
            ),
            backgroundColor: BooklogColors.main,
            foregroundColor: BooklogColors.white,
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: Typo.b16r.copyWith(
                  color: BooklogColors.white,
                ),
              ),
            ],
          ),
        ),
      );
}
