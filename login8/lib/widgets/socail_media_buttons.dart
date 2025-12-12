import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import 'common_socialbtn_widget.dart';
class SocialMediaButtonSection extends StatelessWidget {
  const SocialMediaButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment:MainAxisAlignment.spaceAround,
      children: [
        CommonSocialBtnWidget(title: AppStrings.facebook, onTap: () {  }, logo: AppStrings.facebookLogo),
        CommonSocialBtnWidget(title: AppStrings.google, onTap: () {  }, logo: AppStrings.googleLogo)
      ],
    );
  }
}
