import 'package:flutter/material.dart';
import 'package:login5/constants/app_colors.dart';
import 'package:login5/screens/login_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgColor,
        primaryColor: AppColors.primary
      ),
      home: LoginScreen(),
    );
  }
}
