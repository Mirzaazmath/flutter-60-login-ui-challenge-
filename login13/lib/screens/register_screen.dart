import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login13/constants/app_colors.dart';
import 'package:login13/constants/app_spaces.dart';
import 'package:login13/constants/app_strings.dart';
import 'package:login13/screens/login_screen.dart';
import 'package:login13/utils/extensions.dart';

import '../utils/animation_utils.dart';
import '../utils/navigation_transition_utils.dart';
import '../widgets/common_button_widget.dart';
import '../widgets/common_richtext_widget.dart';
import '../widgets/common_textfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: AppSpaces.s400,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppStrings.bgImage),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: AppSpaces.s30,
                    child: FadeTransitionAnimation(
                      duration: AppSpaces.i1000,

                      child: Container(
                        width: AppSpaces.s80,
                        height: AppSpaces.s200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppStrings.light1Image),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: AppSpaces.s140,
                    child: FadeTransitionAnimation(
                      duration: AppSpaces.i1000,
                      child: Container(
                        width: AppSpaces.s80,
                        height: AppSpaces.s150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppStrings.light2Image),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: AppSpaces.s40,
                    top: AppSpaces.s40,
                    child: FadeTransitionAnimation(
                      duration: AppSpaces.i1000,
                      child: Container(
                        width: AppSpaces.s80,
                        height: AppSpaces.s150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppStrings.clockImage),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: FadeTransitionAnimation(
                      duration: AppSpaces.i1000,
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: AppSpaces.s50),
                          child: Text(
                            AppStrings.signUp,
                            style: GoogleFonts.spectral(
                              textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpaces.s30),
              child: Column(
                children: [
                  FadeTransitionAnimation(
                    duration: AppSpaces.i1000,
                    child: Container(
                      padding: const EdgeInsets.all(AppSpaces.s5),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(AppSpaces.s10),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: AppSpaces.s20,
                            offset: Offset(AppSpaces.s0, AppSpaces.s10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          CommonTextFieldWidget(
                            hintText: AppStrings.email,
                            controller: emailController,
                          ),
                          CommonTextFieldWidget(
                            hintText: AppStrings.confirmPassword,
                            controller: confirmPasswordController,
                            isPasswordField: true,
                          ),
                          CommonTextFieldWidget(
                            hintText: AppStrings.password,
                            controller: passwordController,
                            isPasswordField: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppSpaces.s20.verticalSpace,
                  CommonButtonWidget(title: AppStrings.signUp, onTap: () {}),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FadeTransitionAnimation(
        duration: AppSpaces.i2000,
        child: CommonRichTextWidget(
          title: AppStrings.alreadyHaveAccount,
          clickText: AppStrings.login,
          onTap: () {
            Navigator.of(
              context,
            ).pushReplacement(CustomPageRoute(child: const LoginScreen(),isUp: false));
          },
        ),
      ),
    );
  }
}
