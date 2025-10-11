import 'package:flutter/material.dart';
import 'package:login3/constants/app_spaces.dart';
import 'package:login3/constants/app_strings.dart';
import 'package:login3/screens/register_screen.dart';
import 'package:login3/widgets/common_button_widget.dart';
import 'package:login3/widgets/common_richtext_widget.dart';
import 'package:login3/widgets/common_textfeild_widget.dart';
import 'package:login3/widgets/common_title_widget.dart';

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
          padding: const EdgeInsets.all(AppSpaces.s30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: FlutterLogo(size: AppSpaces.s100)),

              /// *** Login Text *** ///
              CommonTitleWidget(title: AppStrings.login),
              SizedBox(height: AppSpaces.s100),

              /// *** TextField *** ///
              CommonTextFieldWidget(
                controller: _userNameController,
                hintText: AppStrings.email,
              ),
              CommonTextFieldWidget(
                controller: _passwordController,
                hintText: AppStrings.password,
                isPasswordField: true,
              ),
              SizedBox(height: AppSpaces.s100),

              /// *** Button *** ///
              CommonButtonWidget(title: AppStrings.submit, onTap: () {}),
              SizedBox(height: AppSpaces.s50),

              /// *** Rich Text *** ///
              CommonRichTextWidget(
                title: AppStrings.doNotHaveAccount,
                clickText: AppStrings.register,
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
