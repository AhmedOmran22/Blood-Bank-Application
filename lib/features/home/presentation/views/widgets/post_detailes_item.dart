import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class PostDetailesItem extends StatelessWidget {
  const PostDetailesItem({
    super.key,
    required this.label,
    required this.details,
    required this.icon,
  });
  final String label;
  final String details;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Icon(
          size: 20,
          icon,
          color: AppColors.primaryColor,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 14,
                color: Colors.grey.shade600,
                letterSpacing: .5,
              ),
        ),
        const Spacer(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                details,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      letterSpacing: .5,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
