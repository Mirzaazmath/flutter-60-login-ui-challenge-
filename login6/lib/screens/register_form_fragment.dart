import 'package:flutter/material.dart';
import 'package:login6/utils/extensions.dart';
import '../constants/app_colors.dart';
import '../constants/app_spaces.dart';
import '../constants/app_strings.dart';
import '../widgets/common_button_widget.dart';
import '../widgets/common_textfeild.dart';

class RegisterFormFragment extends StatefulWidget {
  const RegisterFormFragment({super.key});

  @override
  State<RegisterFormFragment> createState() => _RegisterFormFragmentState();
}

class _RegisterFormFragmentState extends State<RegisterFormFragment> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextFieldWidget(
          controller: _emailController,
          hintText: AppStrings.email,
        ),
        CommonTextFieldWidget(
          controller: _phoneController,
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
        CommonButtonWidget(title: AppStrings.signUp, onTap: () {}),
        AppSpaces.s50.verticalSpace,
        Text(AppStrings.continueTextRegister),
        AppSpaces.s50.verticalSpace,

        /// *** Social Account *** ///
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpaces.s30,
          children: AppStrings.socialAccount
              .map(
                (item) => Container(
                  height: AppSpaces.s45,
                  width: AppSpaces.s45,
                  padding: EdgeInsets.all(AppSpaces.s10),
                  decoration: BoxDecoration(
                    color: AppColors.bgColor,
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
    );
  }
}
