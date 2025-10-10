import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login2/constants/app_colors.dart';
import 'package:login2/constants/app_spaces.dart';

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
      style: GoogleFonts.alfaSlabOne(
        color:AppColors.colorBlack,
        textStyle: textTheme.bodyMedium?.copyWith(color: AppColors.colorBlack,),
      ),
      decoration: InputDecoration(
        constraints: BoxConstraints(maxHeight: AppSpaces.s70, minHeight: AppSpaces.s70),
        filled: true,
        fillColor: AppColors.textFieldColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpaces.s10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpaces.s10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
        hintText: widget.hintText,
        suffixIcon: widget.isPasswordField
            ? togglePassword
            ? GestureDetector(
          onTap: () {
            setState(() {
              togglePassword = !togglePassword;
            });
          },
          child: Icon(Icons.visibility),
        )
            : GestureDetector(
          onTap: () {
            setState(() {
              togglePassword = !togglePassword;
            });
          },

          child: Icon(Icons.visibility_off),
        )
            : SizedBox(),
      ),
    );
  }
}
