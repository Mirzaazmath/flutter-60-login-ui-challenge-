import 'package:flutter/material.dart';
import 'package:login4/constants/app_colors.dart';
import 'package:login4/screens/login_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.bgColor,

    ),
      home: LoginScreen(),
    );
  }
}
