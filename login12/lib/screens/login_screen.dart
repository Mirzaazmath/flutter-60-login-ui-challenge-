import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login12/constants/app_spaces.dart';
import 'package:login12/constants/app_strings.dart';
import 'package:login12/screens/register_screen.dart';
import 'package:login12/utils/animation_utils.dart';
import 'package:login12/utils/extensions.dart';
import 'package:login12/widgets/common_button_widget.dart';
import 'package:login12/widgets/common_textfield_widget.dart';
import 'package:login12/widgets/common_title_widget.dart';

import '../widgets/common_richtext_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool positionAnimation = false;
  bool doReverse = false;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        positionAnimation = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            right: -AppSpaces.s100,
            top: positionAnimation
                ? -AppSpaces.s300
                : (-AppSpaces.s300 * AppSpaces.s2),
            duration: Duration(milliseconds: 1000),
            child: CircleAvatar(
              radius: AppSpaces.s300,
              backgroundColor: Theme.of(context).primaryColorDark,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpaces.s100),
                  child: CommonTitleWidget(title: AppStrings.welcomeText),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpaces.s30),
              child: ShowUpAnimation(
                reverse: doReverse,
                delay: 1000,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    CommonTextFieldWidget(
                      controller: _emailController,
                      hintText: AppStrings.email,
                    ),
                    CommonTextFieldWidget(
                      controller: _passwordController,
                      hintText: AppStrings.password,
                      isPasswordField: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppStrings.forgetPassword,
                        style: GoogleFonts.abrilFatface(
                          textStyle: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    AppSpaces.s50.verticalSpace,
                    CommonButtonWidget(title: AppStrings.signIn, onTap: () {}),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ShowUpAnimation(
        delay: 1100,
        reverse: doReverse,
        child: CommonRichTextWidget(
          title: AppStrings.doNotHaveAccount,
          clickText: AppStrings.signUp,
          onTap: () {
            setState(() {
              positionAnimation = false;
              doReverse = true;
            });
            Future.delayed(Duration(milliseconds: 1000), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            });
          },
        ),
      ),
    );
  }
}
