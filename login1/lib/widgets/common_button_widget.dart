import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login1/constants/app_space.dart';

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
        height: AppSpace.s50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpace.s25),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorLight,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.lora(
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
