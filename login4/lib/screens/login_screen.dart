import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login4/constants/app_colors.dart';
import 'package:login4/constants/app_spaces.dart';
import 'package:login4/constants/app_strings.dart';
import 'package:login4/screens/register_screen.dart';
import 'package:login4/utils/extensions.dart';
import 'package:login4/widgets/common_button_widget.dart';
import 'package:login4/widgets/common_richtext_widget.dart';
import 'package:login4/widgets/common_textfeild_widget.dart';
import 'package:login4/widgets/common_title_widget.dart';

import '../widgets/common_descriptiontext_widget.dart';

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpaces.s30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSpaces.s50.verticalSpace,

              /// *** Login Text *** ///
              CommonTitleWidget(title: AppStrings.login),
              AppSpaces.s10.verticalSpace,
              CommonDescriptionTextWidget(title: AppStrings.loginDescription),
              AppSpaces.s80.verticalSpace,

              /// *** TextField *** ///
              CommonTextFieldWidget(
                controller: _userNameController,
                hintText: AppStrings.email,
                icon: Icons.person,
              ),
              CommonTextFieldWidget(
                controller: _passwordController,
                hintText: AppStrings.password,
                icon: Icons.lock,
                isPasswordField: true,
              ),

              /// *** Forget Password *** ///
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      dense: true,
                      // To move the checkbox place
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      value: false,
                      onChanged: (value) {},
                      title: Text(
                        AppStrings.rememberMe,
                        style: GoogleFonts.cinzel(
                          textStyle: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    AppStrings.forgetPassword,
                    style: GoogleFonts.cinzel(
                      textStyle: Theme.of(context).textTheme.labelMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              AppSpaces.s50.verticalSpace,

              /// *** Button *** ///
              CommonButtonWidget(title: AppStrings.buttonLogin, onTap: () {}),
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
