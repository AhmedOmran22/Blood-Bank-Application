import 'package:blood_bank/features/more/presentation/views/widgets/select_languauge_item.dart';
import 'package:blood_bank/features/more/presentation/views/widgets/theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
      ],
    );
  }
}
