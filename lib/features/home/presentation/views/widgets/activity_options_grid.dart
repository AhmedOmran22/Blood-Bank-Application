import 'package:blood_bank/features/home/data/models/activity_option_item_model.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/activity_option_item.dart';
import 'package:flutter/material.dart';

class ActivityOptions extends StatelessWidget {
  const ActivityOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActivityOptionItem(
                activityOptionItemModel: activityOptionItems[0],
              ),
              const SizedBox(width: 16),
              ActivityOptionItem(
                activityOptionItemModel: activityOptionItems[1],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActivityOptionItem(
                activityOptionItemModel: activityOptionItems[2],
              ),
              const SizedBox(width: 16),
              ActivityOptionItem(
                activityOptionItemModel: activityOptionItems[3],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<ActivityOptionItemModel> activityOptionItems = [
  ActivityOptionItemModel(
    title: 'Blood Donor',
    subtitle: '120 Post',
  ),
  ActivityOptionItemModel(
    title: 'Request Blood',
    subtitle: 'Get help',
  ),
  ActivityOptionItemModel(
    title: 'Create Post',
    subtitle: 'It\'s easy 1 step',
  ),
  ActivityOptionItemModel(
    title: 'Blood Given',
    subtitle: 'It\'s easy 1 step',
  ),
];
