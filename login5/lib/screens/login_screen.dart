import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login5/constants/app_spaces.dart';
import 'package:login5/constants/app_strings.dart';
import 'package:login5/screens/register_screen.dart';
import 'package:login5/utils/extensions.dart';
import 'package:login5/widgets/common_button_widget.dart';
import 'package:login5/widgets/common_descriptiontext_widget.dart';
import 'package:login5/widgets/common_richtext_widget.dart';
import 'package:login5/widgets/common_textfield_widget.dart';
import 'package:login5/widgets/common_title_widget.dart';



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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpaces.s30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSpaces.s50.verticalSpace,

              /// *** Login Text *** ///
              CommonTitleWidget(title: AppStrings.login),
              AppSpaces.s10.verticalSpace,
              CommonDescriptionTextWidget(title: AppStrings.loginDescription),
              AppSpaces.s80.verticalSpace,

              /// *** TextField *** ///
              CommonTextFieldWidget(
                controller: _userNameController,
                hintText: AppStrings.email,
              ),
              CommonTextFieldWidget(
                controller: _passwordController,
                hintText: AppStrings.password,
                isPasswordField: true,
              ),

              /// *** Forget Password *** ///
              Text(
                  AppStrings.forgetPassword,
                style: GoogleFonts.cinzel(
                  textStyle: Theme.of(context).textTheme.labelMedium
                      ?.copyWith(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                ),
              ),
              AppSpaces.s50.verticalSpace,

              /// *** Button *** ///
              CommonButtonWidget(title:AppStrings.signIn, onTap: () {}),

              Padding(padding: EdgeInsets.symmetric(horizontal: AppSpaces.s50),child: Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.all(AppSpaces.s20),
                    child: Text(
                      AppStrings.or,
                      style: GoogleFonts.oswald(
                        textStyle: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),),
              AppSpaces.s50.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: AppSpaces.s20,
                children: [
                  SizedBox(height: AppSpaces.s20,
                    child: Image.asset(AppStrings.appleLogo),
                  ),
                  Text(
                    AppStrings.appleSignIN,
                    style: GoogleFonts.oswald(
                      textStyle: Theme.of(context).textTheme.labelMedium
                          ?.copyWith(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              AppSpaces.s20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: AppSpaces.s20,
                children: [
                  SizedBox(height: AppSpaces.s20,
                    child: Image.asset(AppStrings.googleLogo),
                  ),
                  Text(
                    AppStrings.googleSignIN,
                    style: GoogleFonts.oswald(
                      textStyle: Theme.of(context).textTheme.labelMedium
                          ?.copyWith(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),

              AppSpaces.s40.verticalSpace,
              /// *** Rich Text *** ///
              CommonRichTextWidget(
                title: AppStrings.doNotHaveAccount,
                clickText: AppStrings.signUp,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
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
