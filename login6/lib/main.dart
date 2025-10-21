import 'package:flutter/material.dart';
import 'package:login6/screens/main_screen.dart';

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
      ),
      home: MainScreen(),
    );
  }
}
