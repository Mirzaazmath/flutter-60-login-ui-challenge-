import 'package:flutter/material.dart';
import 'package:login12/screens/login_screen.dart';

import 'constants/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgColor,
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.shadowColor,
      ),
      home: LoginScreen(),
    );
  }
}
