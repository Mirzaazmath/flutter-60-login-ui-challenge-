import 'package:flutter/material.dart';
import 'package:login9/utils/show_up_animation.dart';
import '../constants/app_spaces.dart';
import '../constants/app_strings.dart';
import '../utils/extension.dart';
import '../widgets/common_button_widget.dart';
import '../widgets/common_richtext_widget.dart';
import '../widgets/common_textfeild_widget.dart';
import '../widgets/header_widget.dart';
import 'login_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  /// boolean to check whether the state is login or not
  bool isLogin = false;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HeaderWidget(
            onTap: () {
              setState(() {
                isLogin = false;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpaces.s20),
            child: !isLogin
                ? ShowUpAnimation(
                    delay: AppSpaces.s200,
                    isDown: true,
                    child: Column(
                      children: [
                        CommonTextFieldWidget(
                          controller: _userNameController,
                          hintText: AppStrings.yourEmail,
                          icon: Icons.mail,
                        ),
                        CommonTextFieldWidget(
                          controller: _passwordController,
                          hintText: AppStrings.password,
                          icon: Icons.key,
                          isPasswordField: true,

                        ),
                        CommonTextFieldWidget(
                          controller: _confirmPasswordController,
                          hintText: AppStrings.confirmPassword,
                          icon: Icons.key,
                          isPasswordField: true,
                        ),
                        AppSpaces.s50.verticalSpace,
                        CommonButtonWidget(
                          title: AppStrings.signup,
                          onTap: () {},
                        ),
                        AppSpaces.s50.verticalSpace,
                        CommonRichTextWidget(
                          title: AppStrings.alreadyHaveAccount,
                          clickText: AppStrings.login,
                          onTap: () {
                            setState(() {
                              isLogin = false;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          ),
        ],
      ),
      /// Login Section
      bottomSheet: LoginSection(
        onTap: () {
          setState(() {
            isLogin = true;
          });
        },
        isLogin: isLogin,
      ),
    );
  }
}
