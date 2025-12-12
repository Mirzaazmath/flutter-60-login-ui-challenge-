import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login8/constants/app_colors.dart';
import 'package:login8/screens/register_screen.dart';
import 'package:login8/utils/extensions.dart';
import 'package:login8/widgets/socail_media_buttons.dart';

import '../constants/app_spaces.dart';
import '../constants/app_strings.dart';
import '../widgets/common_button_widget.dart';
import '../widgets/common_textfield_widget.dart';
import '../widgets/common_title_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpaces.s20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text(
                AppStrings.signup,
                style: GoogleFonts.playwriteAr(
                  textStyle: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.loginBgColor,
      // This avoids the keyboard resizing
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpaces.s30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// *** Login Text *** ///
              CommonTitleWidget(title: AppStrings.login),
              AppSpaces.s50.verticalSpace,

              /// *** TextField *** ///
              CommonTextFieldWidget(
                controller: _userNameController,
                hintText: AppStrings.yourEmail,
              ),
              CommonTextFieldWidget(
                controller: _passwordController,
                hintText: AppStrings.password,
                isPasswordField: true,
              ),
              AppSpaces.s100.verticalSpace,

              /// *** Button *** ///
              CommonButtonWidget(title: AppStrings.login, onTap: () {}),
              AppSpaces.s50.verticalSpace,
              Center(
                child: Text(
                  AppStrings.socialAccountLoginText,
                  style: GoogleFonts.playwriteAr(
                    textStyle: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              AppSpaces.s50.verticalSpace,
              SocialMediaButtonSection(),
            ],
          ),
        ),
      ),
    );
  }
}
