import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class BloodTypeWidget extends StatelessWidget {
  const BloodTypeWidget({super.key, required this.bloodType});
  final String bloodType;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CircleAvatar(
          radius: 18,
          child: Text(
            bloodType,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
