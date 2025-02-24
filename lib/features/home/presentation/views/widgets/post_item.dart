import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/post_model.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.postModel});

  final PostModel postModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.postDetails,
            arguments: postModel,
          );
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.grey,
              width: .5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              spacing: 16,
              children: [
                CircleAvatar(
                  child: Text(postModel.bloodType),
                ),
                Expanded(
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postModel.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          const Icon(
                            Icons.local_hospital_outlined,
                            color: AppColors.primaryColor,
                          ),
                          Expanded(
                            child: Text(
                              postModel.hospitalName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 22,
                            color: AppColors.primaryColor,
                          ),
                          Expanded(
                            child: Text(
                              postModel.dateOfPost,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
