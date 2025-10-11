import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login3/constants/app_colors.dart';

class CommonTitleWidget extends StatelessWidget {
  final String title;
  const CommonTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.lobster(
        textStyle: Theme.of(
          context,
        ).textTheme.headlineLarge?.copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
