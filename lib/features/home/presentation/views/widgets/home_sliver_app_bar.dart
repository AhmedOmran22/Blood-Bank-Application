import 'package:blood_bank/core/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/get_current_user.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Theme.of(context).colorScheme.surface,
      expandedHeight: 80,
      floating: true,
      snap: true,
      flexibleSpace: const FlexibleSpaceBar(),
      title: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: const CircleAvatar(
          radius: 22,
          child: Icon(Icons.person),
        ),
        title: Text(
          getCurrentUser().name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 20,
              ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            "Blood Type : ${getCurrentUser().bloodType}",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
        ),
        trailing: Badge(
          smallSize: 12,
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<ThemeCubit>(context).toggleTheme();
            },
            child: Icon(
              Icons.notifications,
              size: 32,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
