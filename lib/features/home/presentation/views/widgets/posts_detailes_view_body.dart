import 'package:blood_bank/features/home/presentation/views/widgets/post_detailes_item.dart';
import 'package:flutter/material.dart';

import '../../../data/models/post_model.dart';

class PostDetailesViewBody extends StatelessWidget {
  const PostDetailesViewBody({super.key, required this.postModel});
  final PostModel postModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        spacing: 16,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          CircleAvatar(
            radius: 32,
            child: Text(
              postModel.bloodType,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 20,
                  ),
            ),
          ),
          Text(postModel.title, style: Theme.of(context).textTheme.titleLarge),
          Divider(color: Colors.grey.shade600, thickness: .5),
          PostDetailesItem(label: 'Phone', details: postModel.mobileNumber),
        ],
      ),
    );
  }
}
