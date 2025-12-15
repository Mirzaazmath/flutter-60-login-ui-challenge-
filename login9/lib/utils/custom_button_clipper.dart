import 'package:flutter/material.dart';
import 'package:login9/constants/app_spaces.dart';

class CustomBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;
    final path = Path();
    path.moveTo(AppSpaces.s0, AppSpaces.s60);
    path.lineTo(AppSpaces.s0, h);
    path.lineTo(w, h);
    path.lineTo(w, AppSpaces.s60);
    path.quadraticBezierTo(w * AppSpaces.s05, -AppSpaces.s60, AppSpaces.s0, AppSpaces.s60);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
