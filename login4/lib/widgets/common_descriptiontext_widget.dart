import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CommonDescriptionTextWidget extends StatelessWidget {
  final String title;
  const CommonDescriptionTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.cinzel(
        textStyle: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
