import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart' show AppColors;

class BloodGroupsGrid extends StatelessWidget {
  const BloodGroupsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        childAspectRatio: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.bloodtype,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        childCount: 8,
      ),
    );
  }
}
