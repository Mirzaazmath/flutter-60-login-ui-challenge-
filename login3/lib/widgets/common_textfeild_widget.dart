import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login3/constants/app_colors.dart';
import 'package:login3/constants/app_spaces.dart';

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
      style: GoogleFonts.lobster(
        color: AppColors.whiteColor,
        textStyle: textTheme.bodyLarge?.copyWith(color: AppColors.whiteColor),
      ),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: AppSpaces.s70,
          minHeight: AppSpaces.s70,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColorLight),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.lobster(
          textStyle: textTheme.bodyLarge?.copyWith(color: AppColors.textColor),
        ),
        suffixIcon: widget.isPasswordField
            ? togglePassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          togglePassword = !togglePassword;
                        });
                      },
                      child: Icon(Icons.visibility, color: AppColors.textColor),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          togglePassword = !togglePassword;
                        });
                      },

                      child: Icon(
                        Icons.visibility_off,
                        color: AppColors.textColor,
                      ),
                    )
            : SizedBox(),
      ),
    );
  }
}
