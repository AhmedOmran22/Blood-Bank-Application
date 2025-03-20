
import 'package:blood_bank/features/more/presentation/views/widgets/more_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cache/prefs.dart';
import '../../../../../core/theme_cubit/theme_cubit.dart';

class SetingsViewBody extends StatelessWidget {
  const SetingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 16,
      children: [
        MoreItem(
          text: "Language",
          icon: Icons.language,
          onTap: null,
        ),
        ThemeSwitcher(),
      ],
    );
  }
}

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({
    super.key,
  });

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Prefs.getBool("isDark"),
      onChanged: (value) {
        setState(
          () {
            Prefs.setBool("isDark", value);
            BlocProvider.of<ThemeCubit>(context).getCurrentTheme();
          },
        );
      },
    );
  }
}
