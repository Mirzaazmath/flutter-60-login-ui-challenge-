import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CommonTextFieldWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool isPasswordField;
  const CommonTextFieldWidget({
    super.key,
    required this.title,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(
          widget.title,
          style: GoogleFonts.abrilFatface(
            textStyle: Theme.of(context).textTheme.titleMedium,
            color: AppColor.primaryColor,
          ),
        ),
        TextFormField(
          obscureText: (!togglePassword && widget.isPasswordField),
          cursorColor: AppColor.primaryColor,
          style: GoogleFonts.abrilFatface(
            textStyle: Theme.of(context).textTheme.titleMedium,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2
          ),
          decoration: InputDecoration(
            fillColor: AppColor.primaryColor,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor),
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
                            color: AppColor.primaryColor,
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
                            color: AppColor.primaryColor,
                          ),
                        )
                : SizedBox(),
          ),
        ),
      ],
    );
  }
}
