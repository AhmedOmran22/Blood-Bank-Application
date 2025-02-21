import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class BloodTypeWidget extends StatelessWidget {
  const BloodTypeWidget({super.key});

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
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Icon(
          Icons.bloodtype,
          color: AppColors.primaryColor,
          size: 32,
        ),
      ),
    );
  }
}
