import 'package:blood_bank/features/home/data/models/post_model.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/posts_detailes_view_body.dart';
import 'package:flutter/material.dart';

class PostDetailesView extends StatelessWidget {
  const PostDetailesView({super.key, required this.postModel});
  final PostModel postModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Post Detailes",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PostDetailesViewBody(postModel: postModel),
      ),
    );
  }
}
