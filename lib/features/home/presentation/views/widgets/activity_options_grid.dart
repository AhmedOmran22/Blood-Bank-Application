import 'package:blood_bank/features/home/presentation/views/widgets/blood_activity_icon.dart';
import 'package:flutter/material.dart';

class ActivityOptionsGrid extends StatelessWidget {
  const ActivityOptionsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BloodActivityItem(),
            BloodActivityItem(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BloodActivityItem(),
            BloodActivityItem(),
          ],
        ),
      ],
    );
  }
}
