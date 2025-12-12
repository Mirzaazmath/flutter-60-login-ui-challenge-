import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login8/constants/app_strings.dart';

import '../constants/app_colors.dart';
import '../constants/app_spaces.dart';


class CommonTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;

  const CommonTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPasswordField = false,
  });

  @override
  State<CommonTextFieldWidget> createState() => _CommonTextFieldWidgetState();
}

bool togglePassword = false;

class _CommonTextFieldWidgetState extends State<CommonTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      obscureText: (!togglePassword && widget.isPasswordField),
      controller: widget.controller,
      style: GoogleFonts.playwriteAr(
        color: AppColors.primary,
        textStyle: textTheme.bodyLarge?.copyWith(color: AppColors.primary),
      ),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: AppSpaces.s70,
          minHeight: AppSpaces.s70,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.playwriteAr(
          textStyle: textTheme.bodyLarge?.copyWith(color: AppColors.hintTextColor),
        ),
        suffixIcon: widget.isPasswordField
            ? togglePassword
            ? GestureDetector(
          onTap: () {
            setState(() {
              togglePassword = !togglePassword;
            });
          },
          child: Text(AppStrings.forgot,style: GoogleFonts.playwriteAr(
            textStyle: textTheme.bodyLarge?.copyWith(color: AppColors.hintTextColor),
          ),)
        )
            : GestureDetector(
          onTap: () {
            setState(() {
              togglePassword = !togglePassword;
            });
          },

          child:Text(AppStrings.forgot,style: GoogleFonts.playwriteAr(
            textStyle: textTheme.bodySmall?.copyWith(color: AppColors.hintTextColor),
          ),)
        )
            : SizedBox(),
      ),
    );
  }
}