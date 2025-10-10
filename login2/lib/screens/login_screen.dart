import 'package:flutter/material.dart';
import 'package:login2/constants/app_spaces.dart';
import 'package:login2/constants/app_strings.dart';
import 'package:login2/screens/register_screen.dart';
import 'package:login2/utils/extensions.dart';
import 'package:login2/widgets/common_button_widget.dart';
import 'package:login2/widgets/common_textfeild_widget.dart';
import 'package:login2/widgets/common_title_widget.dart';

import '../widgets/common_richtext_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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

              /// *** Login Text *** ///
              CommonTitleWidget(title: AppStrings.signIn),
              Spacer(),

              /// *** TextField *** ///
              CommonTextFieldWidget(
                controller: _userNameController,
                hintText: AppStrings.emailOrUserName,
              ),
              CommonTextFieldWidget(
                controller: _passwordController,
                hintText: AppStrings.password,
                isPasswordField: true,
              ),
              AppSpaces.s100.verticalSpace,

              /// *** Button *** ///
              CommonButtonWidget(title: AppStrings.buttonSignIn, onTap: () {}),
              AppSpaces.s50.verticalSpace,

              /// *** Rich Text *** ///
              CommonRichTextWidget(
                title: AppStrings.doNotHaveAccount,
                clickText: AppStrings.signUp,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
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
