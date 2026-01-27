import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_spaces.dart';

class CommonButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isRegister;
  const CommonButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.isRegister,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSpaces.s50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpaces.s30),
          color: isRegister?AppColors.arbColor1: AppColors.primary,
        ),
        alignment: Alignment.center,
        child: Text(
          title,

          style: GoogleFonts.abrilFatface(
            textStyle: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
