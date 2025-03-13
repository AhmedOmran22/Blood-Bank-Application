import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PostsAndSeeAllRow extends StatelessWidget {
  const PostsAndSeeAllRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Posts".tr(),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(letterSpacing: 1, fontSize: 16),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.allPostsView);
          },
          child: Text(
            "See All".tr(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(letterSpacing: 1, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
