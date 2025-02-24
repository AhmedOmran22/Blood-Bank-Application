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
              Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postModel.title,
                    maxLines: 2,
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
                      Text(
                        postModel.hospitalName,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 14),
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
                      Text(
                        postModel.dateOfPost,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
