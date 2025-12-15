import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login9/constants/app_spaces.dart';

import '../constants/app_strings.dart';
import '../utils/custom_up_clipper.dart';

class HeaderWidget extends StatelessWidget {
  final VoidCallback onTap;
  const HeaderWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ClipPath(
        clipper: CustomUpClipper(),
        child: Container(
          padding: const EdgeInsets.all(AppSpaces.s20),
          height: height * AppSpaces.s025,
          width: double.infinity,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          alignment: Alignment.center,
          child: InkWell(
            onTap: onTap,
            child: Text(
              AppStrings.signup,
              style: GoogleFonts.abrilFatface(
                textStyle: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
    );
  }
}
