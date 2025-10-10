import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login1/constants/app_colors.dart';
import 'package:login1/constants/app_space.dart';

class CommonTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  const CommonTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(bottom: AppSpace.s20),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppSpace.s20),
      decoration: BoxDecoration(
        color: AppColor.textFieldColor,
        borderRadius: BorderRadius.circular(AppSpace.s30),
      ),
      child: TextFormField(
        controller: controller,
        style: GoogleFonts.lora(textStyle: textTheme.bodyMedium),
        // This will align the text vertically just change the y value accordingly
        textAlignVertical: TextAlignVertical(y: AppSpace.s0),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: Icon(icon, color: AppColor.iconColor),
        ),
      ),
    );
  }
}
