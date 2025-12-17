import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login10/constants/app_strings.dart';
import 'package:login10/widgets/common_button_widget.dart';
import 'package:login10/widgets/common_textfeild_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.register,
          style: GoogleFonts.lora(
            textStyle: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        CommonTextFieldWidget(
          controller: _emailController,
          hintText: AppStrings.userName,
        ),
        CommonTextFieldWidget(
          controller: _passwordController,
          hintText: AppStrings.password,
          isPasswordField: true,
        ),
        CommonTextFieldWidget(
          controller: _confirmPasswordController,
          hintText: AppStrings.confirmPassword,
          isPasswordField: true,
        ),
        Spacer(),
        CommonButtonWidget(title: AppStrings.register, onTap: () {}),
        Spacer(),
      ],
    );
  }
}
