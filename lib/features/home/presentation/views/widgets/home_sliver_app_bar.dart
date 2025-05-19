import 'package:blood_bank/core/functions/get_current_user_function.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// import '../../../../../core/functions/get_current_user_function.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Theme.of(context).colorScheme.surface,
      expandedHeight: 90,
      floating: true,
      snap: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: const CircleAvatar(
            radius: 20,
            child: Icon(Icons.person),
          ),
          title: Text(
            getCurrentUserFromBackEndFunction().name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              "Blood Type".tr() +
                  " : " +
                  getCurrentUserFromBackEndFunction().bloodType!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
          ),
          trailing: Badge(
            smallSize: 12,
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: null,
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
      ),
    );
  }
}
