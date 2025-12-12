import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login8/constants/app_spaces.dart';

class CommonSocialBtnWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String logo;
  const CommonSocialBtnWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSpaces.s50,
        width: AppSpaces.s150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpaces.s30),
          border: Border.all(width: 2),
        ),
        padding: EdgeInsets.all(AppSpaces.s10),
        child: Row(
          children: [
            Image.asset(logo),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: GoogleFonts.playwriteAr(
                    textStyle: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
