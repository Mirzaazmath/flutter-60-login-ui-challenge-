import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login3/constants/app_spaces.dart';
import 'package:login3/widgets/common_button_widget.dart';
import 'package:login3/widgets/common_richtext_widget.dart';
import 'package:login3/widgets/common_textfeild_widget.dart';
import 'package:login3/widgets/common_title_widget.dart';

import '../constants/app_strings.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This avoids the keyboard resizing
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpaces.s30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: FlutterLogo(size: AppSpaces.s100)),

              /// *** Register Text *** ///
              CommonTitleWidget(title: AppStrings.register),
              SizedBox(height: AppSpaces.s80),

              /// *** TextField *** ///
              CommonTextFieldWidget(
                controller: _userNameController,
                hintText: AppStrings.email,
              ),
              CommonTextFieldWidget(
                controller: _mobileNumberController,
                hintText: AppStrings.phone,
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

              SizedBox(height: AppSpaces.s30),

              /// *** Button *** ///
              CommonButtonWidget(title: AppStrings.submit, onTap: () {}),
              SizedBox(height: AppSpaces.s50),

              /// *** Rich Text *** ///
              CommonRichTextWidget(
                title: AppStrings.alreadyHaveAccount,
                clickText: AppStrings.login,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
