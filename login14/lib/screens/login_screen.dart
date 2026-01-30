import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login14/constants/app_spaces.dart';
import 'package:login14/widgets/common_button_widget.dart';
import 'package:login14/widgets/common_richtext_widget.dart';
import 'package:login14/widgets/common_textfield_widget.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../utils/animation_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedIndex = 0;
  bool showOption = false;
  bool isLogin = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppStrings.bgImageList[selectedIndex]),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        child: AnimatedContainer(
          height: isLogin ? AppSpace.s450 : AppSpace.s550,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: AppSpace.s30),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(AppSpace.s15),
            color: Colors.black.withOpacity(AppSpace.s01),
          ),
          duration: Duration(milliseconds: AppSpace.i600),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSpace.s20),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: AppSpace.s5,
                sigmaX: AppSpace.s5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpace.s25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Center(
                      child: Text(
                        isLogin ? AppStrings.login : AppStrings.register,
                        style: GoogleFonts.abrilFatface(
                          textStyle: Theme.of(context).textTheme.headlineLarge,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    Spacer(),
                    CommonTextFieldWidget(
                      title: AppStrings.email,
                      controller: _emailController,
                    ),
                    Spacer(),
                    CommonTextFieldWidget(
                      title: AppStrings.password,
                      controller: _passwordController,
                      isPasswordField: true,
                    ),
                    isLogin
                        ? SizedBox()
                        : Column(
                            children: [
                              ShowUpAnimation(
                                delay: AppSpace.i200,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: CommonTextFieldWidget(
                                    title: AppStrings.confirmPassword,
                                    controller: _confirmPasswordController,
                                    isPasswordField: true,
                                  ),
                                ),
                              ),
                            ],
                          ),

                    Spacer(),
                    isLogin
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppStrings.forgotPassword,
                              style: GoogleFonts.abrilFatface(
                                textStyle: Theme.of(
                                  context,
                                ).textTheme.bodyMedium,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          )
                        : SizedBox(),
                    Spacer(),
                    CommonButtonWidget(
                      onTap: () {},
                      title: isLogin ? AppStrings.login : AppStrings.register,
                    ),
                    Spacer(),
                    Center(
                      child: CommonRichTextWidget(
                        title: isLogin
                            ? AppStrings.doNotHaveAccount
                            : AppStrings.alreadyHaveAccount,
                        clickText: isLogin
                            ? AppStrings.register
                            : AppStrings.login,
                        onTap: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(vertical: AppSpace.s10),
        height: AppSpace.s50,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: showOption
                  ? ShowUpAnimation(
                      delay: AppSpace.i200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: AppStrings.bgImageList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: CircleAvatar(
                              radius: AppSpace.s30,
                              backgroundColor: selectedIndex == index
                                  ? AppColor.primaryColor
                                  : Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(AppSpace.s1),
                                child: CircleAvatar(
                                  radius: AppSpace.s30,
                                  backgroundImage: AssetImage(
                                    AppStrings.bgImageList[index],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
            ),
            const SizedBox(width: AppSpace.s20),
            showOption
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        showOption = false;
                      });
                    },
                    child: const Icon(
                      Icons.close,
                      color: AppColor.primaryColor,
                      size: AppSpace.s30,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        showOption = true;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColor.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpace.s1),
                        child: CircleAvatar(
                          radius: AppSpace.s30,
                          backgroundImage: AssetImage(
                            AppStrings.bgImageList[selectedIndex],
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
