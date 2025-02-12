import 'package:blood_bank/core/theme_cubit/theme_cubit.dart';
import 'package:blood_bank/core/widgets/general_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';

class LanguageAndThemeViewBody extends StatelessWidget {
 const LanguageAndThemeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          GeneralButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            text: "change theme",
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
          ),
          GeneralButton(
            onPressed: () {
              context.setLocale(const Locale("en"));
            },
            text: "English",
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
          ),
          GeneralButton(
            onPressed: () {
              context.setLocale(const Locale("ar"));
            },
            text: "Arabic",
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
          ),
          const Spacer(),
          GeneralButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.onBoarding);
            },
            text: "Get Started",
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
