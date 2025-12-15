import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login9/constants/app_colors.dart';
import 'package:login9/constants/app_spaces.dart';

class CommonTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPasswordField;
  const CommonTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isPasswordField = false,
  });

  @override
  State<CommonTextFieldWidget> createState() => _CommonTextFieldWidgetState();
}

class _CommonTextFieldWidgetState extends State<CommonTextFieldWidget> {
  bool togglePassword = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(bottom: AppSpaces.s20),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppSpaces.s20),
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(AppSpaces.s20),
      ),
      child: TextFormField(
        obscureText: (!togglePassword && widget.isPasswordField),
        controller: widget.controller,
        style: GoogleFonts.lora(textStyle: textTheme.bodyMedium),
        // This will align the text vertically just change the y value accordingly
        textAlignVertical: TextAlignVertical(y: AppSpaces.s0),

        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          prefixIcon: Icon(widget.icon, color: AppColors.iconColor),
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
                          color: AppColors.iconColor,
                        ),
                      )
              : SizedBox(),
        ),
      ),
    );
  }
}
