import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_spaces.dart';
import '../utils/animation_utils.dart';

class CommonButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CommonButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransitionAnimation(
      duration: AppSpaces.i2000,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: AppSpaces.s50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpaces.s10),
            gradient: LinearGradient(colors: AppColors.buttonGradient),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: GoogleFonts.spectral(
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
