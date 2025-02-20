import 'package:blood_bank/features/home/presentation/views/widgets/blood_activity_icon.dart';
import 'package:flutter/material.dart';

class ActivityOptionsGrid extends StatelessWidget {
  const ActivityOptionsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        childAspectRatio: 2.3,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => const BloodActivityItem(),
        childCount: 4, // عدد العناصر
      ),
    );
  }
}
