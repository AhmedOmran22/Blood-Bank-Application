import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/activity_option_item_model.dart';

class ActivityOptionItem extends StatelessWidget {
  const ActivityOptionItem({
    super.key,
    required this.activityOptionItemModel,
  });

  final ActivityOptionItemModel activityOptionItemModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey,
            width: .5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bloodtype,
              color: AppColors.primaryColor,
              size: 32,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 2,
              children: [
                Text(
                  activityOptionItemModel.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  activityOptionItemModel.subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.grey.shade600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
//0xFFF8F8F8
