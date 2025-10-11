import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login4/constants/app_colors.dart';
import 'package:login4/constants/app_spaces.dart';

class CommonTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;
  final IconData icon;

  const CommonTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPasswordField = false,
    required this.icon,
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
      style: GoogleFonts.cinzel(
        color: AppColors.blackColor,
        textStyle: textTheme.bodyLarge?.copyWith(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,
        constraints: BoxConstraints(
          maxHeight: AppSpaces.s70,
          minHeight: AppSpaces.s70,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpaces.s30),
          borderSide: BorderSide(color: AppColors.whiteColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpaces.s30),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.cinzel(
          textStyle: textTheme.bodyLarge?.copyWith(color: AppColors.greyColor),
        ),
        prefixIcon: Icon(widget.icon, color: AppColors.greyColor),
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
                        color: AppColors.greyColor,
                      ),
                    )
            : SizedBox(),
      ),
    );
  }
}
