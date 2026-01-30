import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_spaces.dart';

class CommonButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const CommonButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSpace.s40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(AppSpace.s30),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(2, 2)
            )
          ]
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.abrilFatface(
            textStyle: Theme.of(context).textTheme.titleMedium,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
