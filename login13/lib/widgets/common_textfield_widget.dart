import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_spaces.dart';

class CommonTextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPasswordField;
  const CommonTextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPasswordField = false,
  });

  @override
  State<CommonTextFieldWidget> createState() => _CommonTextFieldWidgetState();
}

class _CommonTextFieldWidgetState extends State<CommonTextFieldWidget> {
  bool togglePassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpaces.s8),
      child: TextFormField(
        obscureText: (!togglePassword && widget.isPasswordField),
        controller: widget.controller,

        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          helperStyle: GoogleFonts.spectral(
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
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
                          color: AppColors.primaryColor,
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
                          color: AppColors.shadowColor,
                        ),
                      )
              : SizedBox(),
        ),
      ),
    );
  }
}
