import 'package:flutter/material.dart';
import 'package:login6/constants/app_spaces.dart';
import 'package:login6/constants/app_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login6/screens/register_form_fragment.dart';
import 'package:login6/utils/extensions.dart';

import 'login_form_fragment.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpaces.s20),
            child: Column(
              children: [
                AppSpaces.s50.verticalSpace,
                TabBar(
                  onTap: null,
                  indicatorSize: TabBarIndicatorSize.label,
                  overlayColor: WidgetStateProperty.all<Color>(
                    Colors.transparent,
                  ),
                  padding: EdgeInsets.zero,
                  indicatorColor: Theme.of(context).primaryColor,
                  dividerColor: Colors.transparent,
                  tabs: <Widget>[
                    Text(
                      AppStrings.login,
                      style: GoogleFonts.notoSerifTelugu(
                        textStyle: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Text(
                      AppStrings.signUp,
                      style: GoogleFonts.notoSerifTelugu(
                        textStyle: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
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
    );
  }
}
