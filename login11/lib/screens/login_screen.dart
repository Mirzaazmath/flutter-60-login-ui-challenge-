import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login11/constants/app_colors.dart';
import 'package:login11/constants/app_spaces.dart';
import 'package:login11/constants/app_strings.dart';
import 'package:login11/utils/animation_utils.dart';
import 'package:login11/utils/extensions.dart';
import 'package:login11/widgets/common_button_widget.dart';
import 'package:login11/widgets/common_richtext_widget.dart';
import 'package:login11/widgets/common_textfeild_widget.dart';

import '../widgets/common_tile_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isRegister = false;
  bool showField = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          /////////// ******* BackGround Section ****** //////////
          Column(
            children: [
              Expanded(
                flex: AppSpaces.i3,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(AppSpaces.s30),
                        ),
                        gradient: LinearGradient(
                          colors: isRegister?AppColors.gradientOpt2:AppColors.gradient1
                        ),
                      ),
                    ),
                    Positioned(
                      left: -AppSpaces.s100,
                      top: -AppSpaces.s50,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height:
                            MediaQuery.sizeOf(context).height * AppSpaces.s055,
                        width: MediaQuery.sizeOf(context).width + AppSpaces.s20,
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors:isRegister? AppColors.gradientOpt1:AppColors.gradient2
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(flex: AppSpaces.i2, child: Container()),
            ],
          ),
          ///////// ****** Glass Effect with Login UI ****** ///////////
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTitleWidget(title: "${AppStrings.hi} Dev_73arner"),

              Text(
                AppStrings.welcome,
                style: GoogleFonts.abrilFatface(
                  textStyle: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(color: AppColors.white),
                ),
              ),
              const SizedBox(height: AppSpaces.s20),
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                height: isRegister ? AppSpaces.s500 : AppSpaces.s400,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: AppSpaces.s30),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  borderRadius: BorderRadius.circular(AppSpaces.s15),
                  color: AppColors.white.withOpacity(AppSpaces.s01),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSpaces.s20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaY: AppSpaces.s20,
                      sigmaX: AppSpaces.s20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpaces.s25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              isRegister
                                  ? AppStrings.register
                                  : AppStrings.login,
                              style: GoogleFonts.abrilFatface(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
                          const Spacer(),
                          CommonTextFieldWidget(
                            controller: emailController,
                            hintText: AppStrings.email,
                          ),
                          const Spacer(),
                          CommonTextFieldWidget(
                            controller: passwordController,
                            hintText: AppStrings.password,
                            isPasswordField: true,
                          ),
                          showField
                              ? ShowUpAnimation(
                                  delay: 200,
                                  child: Column(
                                    children: [
                                      CommonTextFieldWidget(
                                        controller: confirmPasswordController,
                                        hintText: AppStrings.confirmPassword,
                                        isPasswordField: true,
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          const Spacer(),
                          CommonButtonWidget(
                            title: isRegister
                                ? AppStrings.register
                                : AppStrings.login,
                            isRegister: isRegister,
                            onTap: () {},
                          ),
                          const Spacer(),
                          AppSpaces.s20.verticalSpace,
                          Center(
                            child: CommonRichTextWidget(
                              title: AppStrings.doNotHaveAccount,
                              clickText: AppStrings.register,
                              onTap: () {
                                if (isRegister) {
                                  setState(() {
                                    isRegister = !isRegister;
                                    showField = !showField;
                                  });
                                } else {
                                  setState(() {
                                    isRegister = !isRegister;
                                  });
                                  Future.delayed(
                                    Duration(milliseconds: 300),
                                    () {
                                      setState(() {
                                        showField = !showField;
                                      });
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
