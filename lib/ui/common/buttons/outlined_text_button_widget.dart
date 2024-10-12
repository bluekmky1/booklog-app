import 'package:flutter/material.dart';

import '../../../theme/booklog_colors.dart';
import '../../../theme/typographies.dart';

class OutlinedTextButtonWidget extends StatelessWidget {
  const OutlinedTextButtonWidget({
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
              side: const BorderSide(
                color: BooklogColors.main,
              ),
              borderRadius: BorderRadiusDirectional.circular(8),
            ),
            backgroundColor: BooklogColors.white,
            foregroundColor: BooklogColors.white,
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: Typo.b16r.copyWith(
                  color: BooklogColors.main,
                ),
              ),
            ],
          ),
        ),
      );
}
