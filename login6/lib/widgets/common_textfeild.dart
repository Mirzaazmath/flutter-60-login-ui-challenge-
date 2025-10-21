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
    return TextFormField(
      obscureText: (!togglePassword && widget.isPasswordField),
      controller: widget.controller,
      style: GoogleFonts.notoSerifTelugu(
        color: AppColors.textColor,
        textStyle: textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: AppSpaces.s70,
          minHeight: AppSpaces.s70,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.hintTextColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.hintTextColor),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.notoSerifTelugu(
          textStyle: textTheme.bodyLarge?.copyWith(
            color: AppColors.hintTextColor,
          ),
        ),
        suffixIcon: widget.isPasswordField
            ? togglePassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          togglePassword = !togglePassword;
                        });
                      },
                      child: Icon(
                        Icons.visibility,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          togglePassword = !togglePassword;
                        });
                      },

                      child: Icon(
                        Icons.visibility_off,
                        color: AppColors.hintTextColor,
                      ),
                    )
            : SizedBox(),
      ),
    );
  }
}
