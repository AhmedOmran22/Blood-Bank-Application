import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class PostDetailesItem extends StatelessWidget {
  const PostDetailesItem({
    super.key,
    required this.label,
    required this.details,
  });
  final String label;
  final String details;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        const Icon(
          Icons.phone,
          color: AppColors.primaryColor,
        ),
        Text(
          "contact preston",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 15,
                color: Colors.grey.shade600,
                letterSpacing: .5,
              ),
        ),
        const Spacer(),
        Text(
          "sajldfnsl",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 15,
                color: Colors.grey.shade600,
                letterSpacing: .5,
              ),
        ),
      ],
    );
  }
}
