import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:login4/constants/app_colors.dart';
import 'package:login4/constants/app_spaces.dart';
import 'package:login4/constants/app_strings.dart';
import 'package:login4/screens/login_screen.dart';
import 'package:login4/utils/extensions.dart';
import 'package:login4/widgets/common_button_widget.dart';
import 'package:login4/widgets/common_descriptiontext_widget.dart';
import 'package:login4/widgets/common_richtext_widget.dart';
import 'package:login4/widgets/common_textfeild_widget.dart';
import 'package:login4/widgets/common_title_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpaces.s30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// *** Login Text *** ///
              CommonTitleWidget(title: AppStrings.createAccount),
              AppSpaces.s10.verticalSpace,
              CommonDescriptionTextWidget(
                title: AppStrings.createAccountDescription,
              ),
              AppSpaces.s50.verticalSpace,

              /// *** TextField *** ///
              CommonTextFieldWidget(
                controller: _userNameController,
                hintText: AppStrings.name,
                icon: Icons.person,
              ),
              CommonTextFieldWidget(
                controller: _emailController,
                hintText: AppStrings.email,
                icon: Icons.email,
              ),
              CommonTextFieldWidget(
                controller: _passwordController,
                hintText: AppStrings.password,
                icon: Icons.lock,
                isPasswordField: true,
              ),
              CommonTextFieldWidget(
                controller: _confirmPasswordController,
                hintText: AppStrings.confirmPassword,
                icon: Icons.lock,
                isPasswordField: true,
              ),
              AppSpaces.s50.verticalSpace,

              /// *** Button *** ///
              CommonButtonWidget(title: AppStrings.createAccount, onTap: () {}),

              AppSpaces.s50.verticalSpace,

              /// *** Rich Text *** ///
              CommonRichTextWidget(
                title: AppStrings.alreadyHaveAccount,
                clickText: AppStrings.signIn,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),

              Divider(height: AppSpaces.s40),
              Text(
                AppStrings.continueText,
                style: GoogleFonts.cinzel(
                  textStyle: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              AppSpaces.s40.verticalSpace,

              /// *** Social Account *** ///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: AppStrings.socialAccount
                    .map(
                      (item) => Container(
                        height: AppSpaces.s45,
                        width: AppSpaces.s45,
                        padding: EdgeInsets.all(AppSpaces.s10),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadowColor,
                              blurRadius: AppSpaces.s10,
                              offset: Offset(AppSpaces.s0, AppSpaces.s2),
                            ),
                          ],
                        ),
                        child: Image.asset(item, fit: BoxFit.cover),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
