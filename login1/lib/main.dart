import 'package:flutter/material.dart';
import 'package:login1/constants/app_colors.dart';
import 'package:login1/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.bgColor,
        primaryColor: AppColor.primary,
        primaryColorLight: AppColor.secondary,
      ),
      home: LoginScreen(),
    );
  }
}
