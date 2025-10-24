import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login7/utils/extensions.dart';
import '../constants/app_spaces.dart';
import '../constants/app_strings.dart';
import '../widgets/common_button_widget.dart';
import '../widgets/common_richtext_widget.dart';
import '../widgets/common_textfield_widget.dart';

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
          icon: Icons.person,
        ),
        CommonTextFieldWidget(
          controller: _passwordController,
          hintText: AppStrings.password,
          isPasswordField: true,
          icon: Icons.key,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppStrings.forgetPassword,
            style: GoogleFonts.cinzel(
              textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        AppSpaces.s50.verticalSpace,
        CommonButtonWidget(title: AppStrings.login, onTap: () {}),
        AppSpaces.s50.verticalSpace,
        CommonRichTextWidget(
          title: AppStrings.doNotHaveAccount,
          clickText: AppStrings.register,
          onTap: () {},
        ),
      ],
    );
  }
}
