import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login1/constants/app_stings.dart';
import 'package:login1/utils/extensions.dart';
import 'package:login1/widgets/common_button_widget.dart';
import 'package:login1/widgets/common_textfield_widget.dart';
import 'package:login1/widgets/common_title_widget.dart';

import '../constants/app_space.dart';
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
          padding: const EdgeInsets.all(AppSpace.s20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// *** Register Text *** ///
              CommonTitleWidget(title: AppStrings.register),
              AppSpace.s100.verticalSpace,

              /// *** TextField *** ///
              CommonTextFieldWidget(
                controller: _userNameController,
                hintText: AppStrings.emailOrUserName,
                icon: Icons.person_2_outlined,
              ),
              CommonTextFieldWidget(
                controller: _mobileNumberController,
                hintText: AppStrings.mobileNumber,
                icon: Icons.phone_outlined,
              ),
              CommonTextFieldWidget(
                controller: _passwordController,
                hintText: AppStrings.password,
                icon: Icons.key,
              ),
              CommonTextFieldWidget(
                controller: _confirmPasswordController,
                hintText: AppStrings.confirmPassword,
                icon: Icons.key,
              ),
              AppSpace.s100.verticalSpace,

              /// *** Button *** ///
              CommonButtonWidget(title: AppStrings.register, onTap: () {}),
            ],
          ),
        ),
      ),

      /// *** Rich Text *** ///
      bottomNavigationBar: CommonRichTextWidget(
        title: AppStrings.alreadyHaveAccount,
        clickText: AppStrings.login,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
      ),
    );
  }
}
