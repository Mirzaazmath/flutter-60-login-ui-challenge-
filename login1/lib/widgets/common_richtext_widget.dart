import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login1/constants/app_colors.dart';
import 'package:login1/constants/app_space.dart';

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
      height: AppSpace.s50,
      child: Align(
        alignment: Alignment.topCenter,
        child: RichText(
          text: TextSpan(
            style: GoogleFonts.lora(
              textStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            children: <TextSpan>[
              TextSpan(text: title),
              TextSpan(
                text: clickText,
                style: GoogleFonts.lora(
                  textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColor.richTextTapColor,
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
