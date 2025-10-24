import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login7/utils/extensions.dart';
import '../constants/app_spaces.dart';
import '../constants/app_strings.dart';
import '../widgets/common_button_widget.dart';
import '../widgets/common_richtext_widget.dart';
import '../widgets/common_textfield_widget.dart';

class RegisterFormFragment extends StatefulWidget {
  const RegisterFormFragment({super.key});

  @override
  State<RegisterFormFragment> createState() => _RegisterFormFragmentState();
}

class _RegisterFormFragmentState extends State<RegisterFormFragment> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextFieldWidget(
          controller: _nameController,
          hintText: AppStrings.name,
          icon: Icons.person,
        ),
        CommonTextFieldWidget(
          controller: _emailController,
          hintText: AppStrings.email,
          icon: Icons.mail,
        ),
        CommonTextFieldWidget(
          controller: _passwordController,
          hintText: AppStrings.password,
          isPasswordField: true,
          icon: Icons.key,
        ),
        CommonTextFieldWidget(
          controller: _confirmPasswordController,
          hintText: AppStrings.confirmPassword,
          isPasswordField: true,
          icon: Icons.key,
        ),

        AppSpaces.s50.verticalSpace,
        CommonButtonWidget(title: AppStrings.register, onTap: () {}),
        AppSpaces.s50.verticalSpace,
        CommonRichTextWidget(
          title: AppStrings.alreadyHaveAccount,
          clickText: AppStrings.login,
          onTap: () {},
        ),
      ],
    );
  }
}
