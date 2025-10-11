import 'package:flutter/material.dart';
import 'package:login5/constants/app_spaces.dart';
import 'package:login5/constants/app_strings.dart';
import 'package:login5/screens/login_screen.dart';
import 'package:login5/utils/extensions.dart';
import 'package:login5/widgets/common_button_widget.dart';
import 'package:login5/widgets/common_descriptiontext_widget.dart';
import 'package:login5/widgets/common_richtext_widget.dart';
import 'package:login5/widgets/common_textfield_widget.dart';
import 'package:login5/widgets/common_title_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpaces.s30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// *** Register Text *** ///
              CommonTitleWidget(title: AppStrings.createAccount),
              AppSpaces.s10.verticalSpace,
              CommonDescriptionTextWidget(
                title: AppStrings.createAccountDescription,
              ),
              AppSpaces.s50.verticalSpace,

              /// *** TextField *** ///
              Row(
                spacing: AppSpaces.s20,
                children: [
                  Expanded(
                    child: CommonTextFieldWidget(
                      controller: _firstNameController,
                      hintText: AppStrings.firstName,
                    ),
                  ),
                  Expanded(
                    child: CommonTextFieldWidget(
                      controller: _lastNameController,
                      hintText: AppStrings.lastName,
                    ),
                  ),
                ],
              ),
              CommonTextFieldWidget(
                controller: _emailController,
                hintText: AppStrings.email,
              ),
              CommonTextFieldWidget(
                controller: _mobileController,
                hintText: AppStrings.phone,
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

              /// *** Button *** ///
              CommonButtonWidget(title: AppStrings.signIn, onTap: () {}),

              AppSpaces.s50.verticalSpace,

              /// *** Rich Text *** ///
              CommonRichTextWidget(
                title: AppStrings.alreadyHaveAccount,
                clickText: AppStrings.login,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
