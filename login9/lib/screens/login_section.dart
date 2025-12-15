import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login9/utils/show_up_animation.dart';

import '../constants/app_spaces.dart';
import '../constants/app_strings.dart';
import '../utils/custom_button_clipper.dart';
import '../utils/extension.dart';
import '../widgets/common_button_widget.dart';
import '../widgets/common_richtext_widget.dart';
import '../widgets/common_textfeild_widget.dart';

class LoginSection extends StatefulWidget {
  final bool isLogin;
  final VoidCallback onTap;
  const LoginSection({super.key, required this.onTap, required this.isLogin});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
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
    var height = MediaQuery.of(context).size.height;
    return ClipPath(
      clipper: CustomBottomClipper(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: AppSpaces.s400),
        curve: Curves.decelerate,
        color: widget.isLogin ? Colors.white : Theme.of(context).primaryColor,
        height: widget.isLogin
            ? height * AppSpaces.s082
            : height * AppSpaces.s01,
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpaces.s20),
        child: Column(
          children: [
            InkWell(
              onTap: widget.onTap,
              child: Text(
                AppStrings.login,
                style: GoogleFonts.abrilFatface(
                  textStyle: Theme.of(context).textTheme.headlineMedium
                      ?.copyWith(
                        color: widget.isLogin ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Expanded(
              child: widget.isLogin
                  ? ShowUpAnimation(
                      delay: AppSpaces.s200,
                      child: Column(
                        children: [
                          AppSpaces.s100.verticalSpace,
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

                          AppSpaces.s50.verticalSpace,
                          CommonButtonWidget(
                            title: AppStrings.login,
                            onTap: () {},
                          ),
                          Spacer(),
                          CommonRichTextWidget(
                            title: AppStrings.doNotHaveAccount,
                            clickText: AppStrings.signup,
                            onTap: widget.onTap,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
