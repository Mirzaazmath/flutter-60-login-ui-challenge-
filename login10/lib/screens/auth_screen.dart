import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login10/constants/app_colors.dart';
import 'package:login10/constants/app_spaces.dart';
import 'package:login10/constants/app_strings.dart';
import 'package:login10/screens/login_screen.dart';
import 'package:login10/screens/sign_up_screen.dart';
import 'package:login10/widgets/common_richtext_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isLogin = true;
  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * AppSpaces.s055,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppStrings.bgImage),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(AppSpaces.s30),
                  ),
                ),
              ),
            ],
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context,animation) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..setEntry(3,2, 0.001)..rotateY(_controller.value*pi),
                child: AnimatedContainer(
                  duration: Duration(milliseconds:400),
                  width: MediaQuery.sizeOf(context).width * AppSpaces.s08,
                  height: _controller.value<AppSpaces.s02?MediaQuery.sizeOf(context).height * AppSpaces.s055: MediaQuery.sizeOf(context).height * AppSpaces.s065,
                  padding: EdgeInsets.all(AppSpaces.s20),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(AppSpaces.s20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowDark,
                        offset: Offset(AppSpaces.s0, AppSpaces.s10),
                        blurRadius: AppSpaces.s20,
                        spreadRadius: -AppSpaces.s10,
                      ),
                      BoxShadow(
                        color: AppColors.shadowLight,
                        offset: Offset(-AppSpaces.s10, AppSpaces.s0),
                        blurRadius: AppSpaces.s2,
                        spreadRadius: -AppSpaces.s10,
                      ),
                    ],
                  ),
                  child:_controller.value<AppSpaces.s05?LoginScreen(): Transform(
                    alignment: Alignment.center,
                      transform: Matrix4.identity()..setEntry(3,2, 0.001)..rotateY(pi),
                      child: SignUpScreen()),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: AppSpaces.s100,
        child: CommonRichTextWidget(
          title: isLogin?  AppStrings.doNotHaveAccount:AppStrings.alreadyHaveAccount,
          clickText: isLogin? AppStrings.register:AppStrings.login,
          onTap: () {
            if (isLogin) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            setState(() {
              isLogin = !isLogin;
            });
          },
        ),
      ),
    );
  }
}
