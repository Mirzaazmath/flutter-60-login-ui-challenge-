import 'package:flutter/material.dart';
import 'package:login6/utils/extensions.dart';

import '../constants/app_colors.dart';
import '../constants/app_spaces.dart';
import '../constants/app_strings.dart';
import '../widgets/common_button_widget.dart';
import '../widgets/common_richtext_widget.dart';
import '../widgets/common_textfeild.dart';

class LoginFormFragment extends StatefulWidget {
  const LoginFormFragment({super.key});

  @override
  State<LoginFormFragment> createState() => _LoginFormFragmentState();
}

class _LoginFormFragmentState extends State<LoginFormFragment> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          child: Text(AppStrings.forgetPassword),
        ),
        AppSpaces.s50.verticalSpace,
        CommonButtonWidget(title: AppStrings.login, onTap: () {}),
        AppSpaces.s50.verticalSpace,
        Text(AppStrings.continueText),
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
        AppSpaces.s50.verticalSpace,
        CommonRichTextWidget(
          title: AppStrings.doNotHaveAccount,
          clickText: AppStrings.signUp,
          onTap: () {},
        ),
      ],
    );
  }
}
