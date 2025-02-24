import 'package:blood_bank/features/home/presentation/views/widgets/posts_sliver_list.dart';
import 'package:flutter/material.dart';

import '../../../data/models/post_model.dart';

class AllPostsViewBody extends StatelessWidget {
  const AllPostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        PostsSliverList(childCount: posts.length),
        PostsSliverList(childCount: posts.length),
      ],
    );
  }
}
