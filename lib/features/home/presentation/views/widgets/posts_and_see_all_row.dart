import 'package:flutter/material.dart';

class PostsAndSeeAllRow extends StatelessWidget {
  const PostsAndSeeAllRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Text(
            "Posts",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(letterSpacing: 1, fontSize: 18),
          ),
          const Spacer(),
          Text(
            "See All",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(letterSpacing: 1, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
