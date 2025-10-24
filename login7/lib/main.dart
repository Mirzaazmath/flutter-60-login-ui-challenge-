import 'package:flutter/material.dart';
import 'package:login7/screens/main_screen.dart';

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
        primaryColor: AppColors.primary,
        primaryColorLight: AppColors.primary,
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
      home: MainScreen(),
    );
  }
}
