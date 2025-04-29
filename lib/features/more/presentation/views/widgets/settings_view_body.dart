import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:blood_bank/core/utils/app_colors.dart';
import 'package:blood_bank/core/widgets/general_button.dart';
import 'package:blood_bank/features/more/presentation/views/widgets/select_languauge_item.dart';
import 'package:blood_bank/features/more/presentation/views/widgets/theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';

class SetingsViewBody extends StatelessWidget {
  const SetingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select language".tr(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.normal,
              ),
        ),
        const SizedBox(height: 16),
        const SelectLanguageItem(),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              "Dark Mode".tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
            ),
            const Spacer(),
            const ThemeSwitcher(),
          ],
        ),
        const Spacer(),
        GeneralButton(
          onPressed: () async {
            Prefs.removeData(key: kToken);
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
              (route) => false,
            );
          },
          text: "Logout",
          backgroundColor: AppColors.primaryColor,
          textColor: AppColors.whiteColor,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .1)
      ],
    );
  }
}
