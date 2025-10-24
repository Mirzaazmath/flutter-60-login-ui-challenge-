import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login7/constants/app_colors.dart';
import 'package:login7/screens/login_fragment.dart';
import 'package:login7/screens/register_fragment.dart';
import 'package:login7/utils/extensions.dart';

import '../constants/app_spaces.dart';
import '../constants/app_strings.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpaces.s20),
                child: Column(
                  children: [
                    AppSpaces.s100.verticalSpace,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: AppSpaces.s250,
                        child: TabBar(
                          onTap: null,
                          indicatorSize: TabBarIndicatorSize.label,
                          overlayColor: WidgetStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                          labelPadding: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          indicatorColor: AppColors.textColor,
                          dividerColor: Colors.transparent,
                          tabs: <Widget>[
                            Text(
                              AppStrings.login,
                              style: GoogleFonts.notoSerifTelugu(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              AppStrings.register,
                              style: GoogleFonts.notoSerifTelugu(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSpaces.s50.verticalSpace,
                    Expanded(
                      child: TabBarView(
                        children: [LoginFormFragment(), RegisterFormFragment()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: AppSpaces.s10,
          top: -AppSpaces.s30,
          child: CircleAvatar(
            radius: AppSpaces.s60,
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
        Positioned(
          top: -AppSpaces.s135,
          left: -AppSpaces.s10,
          child: CircleAvatar(
            radius: AppSpaces.s150,
            backgroundColor: AppColors.primaryLight,
            child: Padding(
              padding: const EdgeInsets.all(AppSpaces.s40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: AppSpaces.s30,
                  children: [
                    CircleAvatar(
                      radius: AppSpaces.s15,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    CircleAvatar(
                      radius: AppSpaces.s30,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: AppSpaces.s30,
          bottom: -AppSpaces.s30,
          child: Container(
            height: AppSpaces.s150,
            width: AppSpaces.s100,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSpaces.s50),
                topRight: Radius.circular(AppSpaces.s50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSpaces.s15,
              children: [
                CircleAvatar(
                  radius: AppSpaces.s10,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                CircleAvatar(
                  radius: AppSpaces.s5,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
