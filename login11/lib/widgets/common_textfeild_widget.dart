
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpaces.s5,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppSpaces.s10),
          child: Text(widget.hintText,style: GoogleFonts.abrilFatface(
            textStyle: textTheme.bodyLarge?.copyWith(color: AppColors.white),
          ),),
        ),
        TextFormField(
          obscureText: (!togglePassword && widget.isPasswordField),
          controller: widget.controller,
          style: GoogleFonts.abrilFatface(
            color: AppColors.black.withOpacity(0.5),
            textStyle: textTheme.bodyLarge?.copyWith(color: AppColors.primary),
          ),
          cursorColor: AppColors.white,
          decoration: InputDecoration(
            fillColor:AppColors.white.withOpacity(0.5),
            filled: true,
            constraints: BoxConstraints(maxHeight: AppSpaces.s70, minHeight: AppSpaces.s70),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpaces.s30),
              borderSide: BorderSide(color: AppColors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpaces.s30),
              borderSide: BorderSide(color:AppColors.white),
            ),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.abrilFatface(
              textStyle: textTheme.bodySmall?.copyWith(color: AppColors.black.withOpacity(0.5),),
            ),
            suffixIcon: widget.isPasswordField
                ? togglePassword
                ? GestureDetector(
              onTap: () {
                setState(() {
                  togglePassword = !togglePassword;
                });
              },
              child: Icon(Icons.visibility, color: AppColors.iconColor),
            )
                : GestureDetector(
              onTap: () {
                setState(() {
                  togglePassword = !togglePassword;
                });
              },

              child: Icon(Icons.visibility_off, color: AppColors.iconColor,),
            )
                : SizedBox(),
          ),
        ),
      ],
    );
  }
}
