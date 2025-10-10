import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTitleWidget extends StatelessWidget {
  final String title;
  const CommonTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: GoogleFonts.alfaSlabOne(
        textStyle: Theme.of(
          context,
        ).textTheme.headlineLarge?.copyWith(color: Theme.of(context).primaryColor),
      ),
    );
  }
}