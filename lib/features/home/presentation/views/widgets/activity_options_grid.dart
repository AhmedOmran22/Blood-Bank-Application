import 'package:blood_bank/features/home/presentation/views/widgets/activity_option_item.dart';
import 'package:flutter/material.dart';

class ActivityOptions extends StatelessWidget {
  const ActivityOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActivityOptionItem(),
              SizedBox(width: 16),
              ActivityOptionItem(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActivityOptionItem(),
              SizedBox(width: 16),
              ActivityOptionItem(),
            ],
          ),
        ],
      ),
    );
  }
}
