import 'package:flutter/material.dart';
import 'package:login2/constants/app_spaces.dart';
import 'package:login2/constants/app_strings.dart';
import 'package:login2/utils/extensions.dart';
import 'package:login2/widgets/common_button_widget.dart';
import 'package:login2/widgets/common_textfeild_widget.dart';
import 'package:login2/widgets/common_title_widget.dart';

import '../widgets/common_richtext_widget.dart';
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
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This avoids the keyboard resizing
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpaces.s20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),

              /// *** Register Text *** ///
              CommonTitleWidget(title: AppStrings.signUp),
              Spacer(),

              /// *** TextField *** ///
              CommonTextFieldWidget(
                controller: _userNameController,
                hintText: AppStrings.emailOrUserName
              ),
              CommonTextFieldWidget(
                controller: _mobileNumberController,
                hintText: AppStrings.mobileNumber
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
              AppSpaces.s100.verticalSpace,

              /// *** Button *** ///
              CommonButtonWidget(title: AppStrings.buttonSignUp, onTap: () {}),
              AppSpaces.s50.verticalSpace,

              /// *** Rich Text *** ///
              CommonRichTextWidget(
                title: AppStrings.alreadyHaveAccount,
                clickText:AppStrings.signIn,
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
