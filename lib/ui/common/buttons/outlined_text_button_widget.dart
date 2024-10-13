import 'package:flutter/material.dart';

import '../../../theme/booklog_colors.dart';
import '../../../theme/typographies.dart';

class OutlinedTextButtonWidget extends StatelessWidget {
  const OutlinedTextButtonWidget({
    required this.text,
    this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;

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
          onPressed: onPressed,
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
