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
          child: Text(widget.hintText,style: GoogleFonts.cinzel(
            textStyle: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),),
        ),
        TextFormField(
          obscureText: (!togglePassword && widget.isPasswordField),
          controller: widget.controller,
          style: GoogleFonts.cinzel(
            color: AppColors.primary,
            textStyle: textTheme.bodyLarge?.copyWith(color: AppColors.primary,fontWeight: FontWeight.bold),
          ),
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            constraints: BoxConstraints(maxHeight: AppSpaces.s70, minHeight: AppSpaces.s70),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpaces.s30),
              borderSide: BorderSide(color: AppColors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpaces.s30),
              borderSide: BorderSide(color:AppColors.primary),
            ),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.oswald(
              textStyle: textTheme.bodyLarge?.copyWith(color: AppColors.shadowDark,),
            ),
            suffixIcon: widget.isPasswordField
                ? togglePassword
                ? GestureDetector(
              onTap: () {
                setState(() {
                  togglePassword = !togglePassword;
                });
              },
              child: Icon(Icons.visibility, color: AppColors.primary),
            )
                : GestureDetector(
              onTap: () {
                setState(() {
                  togglePassword = !togglePassword;
                });
              },

              child: Icon(Icons.visibility_off, color: AppColors.shadowDark,),
            )
                : SizedBox(),
          ),
        ),
      ],
    );
  }
}