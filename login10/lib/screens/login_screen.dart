import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login10/constants/app_strings.dart';
import 'package:login10/widgets/common_button_widget.dart';
import 'package:login10/widgets/common_textfeild_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.login,
          style: GoogleFonts.lora(
            textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Spacer(),
        CommonTextFieldWidget(controller: _emailController, hintText: AppStrings.userName),
        CommonTextFieldWidget(controller: _passwordController, hintText: AppStrings.password,isPasswordField: true),
        Spacer(),
        CommonButtonWidget(title: AppStrings.login, onTap: (){}),
        Spacer(),
      ],
    );
  }
}
