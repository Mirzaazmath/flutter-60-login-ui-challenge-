import 'package:flutter/material.dart';
import 'package:login12/constants/app_spaces.dart';
import 'package:login12/constants/app_strings.dart';
import 'package:login12/screens/login_screen.dart';
import 'package:login12/utils/animation_utils.dart';
import 'package:login12/utils/extensions.dart';
import 'package:login12/widgets/common_button_widget.dart';
import 'package:login12/widgets/common_textfield_widget.dart';
import 'package:login12/widgets/common_title_widget.dart';

import '../widgets/common_richtext_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
                  child: CommonTitleWidget(title: AppStrings.createAccount),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpaces.s150.verticalSpace,
                    CommonTextFieldWidget(
                      controller: _nameController,
                      hintText: AppStrings.name,
                    ),
                    CommonTextFieldWidget(
                      controller: _emailController,
                      hintText: AppStrings.email,
                    ),
                    CommonTextFieldWidget(
                      controller: _passwordController,
                      hintText: AppStrings.password,
                      isPasswordField: true,
                    ),
                    CommonTextFieldWidget(
                      controller: _confirmPasswordController,
                      hintText: AppStrings.confirmPassword,
                      isPasswordField: true,
                    ),

                    AppSpaces.s50.verticalSpace,
                    CommonButtonWidget(title: AppStrings.signUp, onTap: () {}),
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
          title: AppStrings.alreadyHaveAccount,
          clickText: AppStrings.signIn,
          onTap: () {
            setState(() {
              positionAnimation = false;
              doReverse = true;
            });
            Future.delayed(Duration(milliseconds: 1000), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            });
          },
        ),
      ),
    );
  }
}
