import 'package:blood_bank/features/home/data/models/activity_option_item_model.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/activity_option_item.dart';
import 'package:flutter/material.dart';

class ActivityOptionsGrid extends StatelessWidget {
  const ActivityOptionsGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 4.6),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: activityOptionItems.length,
        itemBuilder: (context, index) => ActivityOptionItem(
          onTap: () {
            Navigator.pushNamed(
              context,
              activityOptionItems[index].navigateTo,
            );
          },
          activityOptionItemModel: activityOptionItems[index],
        ),
      ),
    );
  }
}
