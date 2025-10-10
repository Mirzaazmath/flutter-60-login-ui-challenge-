import 'package:flutter/material.dart';
import 'package:login1/constants/app_space.dart';
import 'package:login1/constants/app_stings.dart';
import 'package:login1/screens/register_screen.dart';
import 'package:login1/utils/extensions.dart';
import 'package:login1/widgets/common_button_widget.dart';
import 'package:login1/widgets/common_textfield_widget.dart';

import '../widgets/common_richtext_widget.dart';
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
              /// *** Login Text *** ///
              CommonTitleWidget(title: AppStrings.login),
              AppSpace.s100.verticalSpace,

              /// *** TextField *** ///
              CommonTextFieldWidget(
                controller: _userNameController,
                hintText: AppStrings.emailOrUserName,
                icon: Icons.person_2_outlined,
              ),
              CommonTextFieldWidget(
                controller: _passwordController,
                hintText: AppStrings.password,
                icon: Icons.key,
              ),
              AppSpace.s100.verticalSpace,

              /// *** Button *** ///
              CommonButtonWidget(title: AppStrings.buttonLogin, onTap: () {}),
            ],
          ),
        ),
      ),

      /// *** Rich Text *** ///
      bottomNavigationBar: CommonRichTextWidget(
        title: AppStrings.doNotHaveAccount,
        clickText: AppStrings.register,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()),
          );
        },
      ),
    );
  }
}
