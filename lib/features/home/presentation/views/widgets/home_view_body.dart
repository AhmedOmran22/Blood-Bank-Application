import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/get_current_user.dart';
import '../../../../../core/theme_cubit/theme_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Text(
            getCurrentUser().email,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            getCurrentUser().name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            getCurrentUser().phoneNumber,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            getCurrentUser().bloodType,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            child: const Text('Change Theme'),
          ),
          ElevatedButton(
            onPressed: () {
              context.setLocale(const Locale('ar'));
            },
            child: const Text('arabic language'),
          ),
          ElevatedButton(
            onPressed: () {
              context.setLocale(const Locale('en'));
            },
            child: const Text('English language'),
          ),
        ],
      ),
    );
  }
}
