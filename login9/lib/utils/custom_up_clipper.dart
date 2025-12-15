import 'package:flutter/material.dart';

import '../constants/app_spaces.dart';

class CustomUpClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;
    final path = Path();
    path.lineTo(AppSpaces.s0, h);
    path.quadraticBezierTo(w * AppSpaces.s05, h - AppSpaces.s110, w, h);
    path.lineTo(w, AppSpaces.s0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
