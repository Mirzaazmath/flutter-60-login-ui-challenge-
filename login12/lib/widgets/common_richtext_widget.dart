import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login12/constants/app_colors.dart';

import '../constants/app_spaces.dart';

class CommonRichTextWidget extends StatelessWidget {
  final String title, clickText;
  final VoidCallback onTap;
  const CommonRichTextWidget({
    super.key,
    required this.title,
    required this.clickText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpaces.s50,
      child: Align(
        alignment: Alignment.topCenter,
        child: RichText(
          text: TextSpan(
            style: GoogleFonts.notoSerifTelugu(
              textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            children: <TextSpan>[
              TextSpan(text: title),
              TextSpan(
                text: clickText,
                style: GoogleFonts.notoSerifTelugu(
                  textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
