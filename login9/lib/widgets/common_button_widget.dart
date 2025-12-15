import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_spaces.dart';


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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSpaces.s50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpaces.s30),
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: AppSpaces.s10,
              offset: Offset(AppSpaces.s10, AppSpaces.s10),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.abrilFatface(
            textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}