import 'package:blood_bank/features/home/data/models/post_model.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/post_item.dart';
import 'package:flutter/material.dart';

class HomePostsSliverList extends StatelessWidget {
  const HomePostsSliverList({
    super.key,
    required this.childCount,
  });
  final int childCount;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: childCount,
        (context, index) {
          return PostItem(postModel: posts[index]);
        },
      ),
    );
  }
}
