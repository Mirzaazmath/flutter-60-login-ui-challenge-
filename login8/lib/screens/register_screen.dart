import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login8/constants/app_colors.dart';
import 'package:login8/screens/login_screen.dart';
import 'package:login8/utils/extensions.dart';

import '../constants/app_spaces.dart';
import '../constants/app_strings.dart';
import '../widgets/common_button_widget.dart';
import '../widgets/common_textfield_widget.dart';
import '../widgets/common_title_widget.dart';
import '../widgets/socail_media_buttons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
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
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                AppStrings.login,
                style: GoogleFonts.playwriteAr(
                  textStyle: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.signUpBgColor,
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
              CommonTitleWidget(title: AppStrings.signup),
              AppSpaces.s50.verticalSpace,

              /// *** TextField *** ///
              CommonTextFieldWidget(
                controller: _emailController,
                hintText: AppStrings.yourEmail,
              ),
              CommonTextFieldWidget(
                controller: _userNameController,
                hintText: AppStrings.name,
              ),
              CommonTextFieldWidget(
                controller: _passwordController,
                hintText: AppStrings.password,
                isPasswordField: true,
              ),

              AppSpaces.s50.verticalSpace,

              /// *** Button *** ///
              CommonButtonWidget(title: AppStrings.signup, onTap: () {}),
              AppSpaces.s50.verticalSpace,
              Center(
                child: Text(
                  AppStrings.socialAccountSignUpText,
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
