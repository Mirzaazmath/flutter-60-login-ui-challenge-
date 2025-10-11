import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CommonDescriptionTextWidget extends StatelessWidget {
  final String title;
  const CommonDescriptionTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.oswald(
        textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color:Theme.of(context).primaryColor),
      ),
    );
  }
}