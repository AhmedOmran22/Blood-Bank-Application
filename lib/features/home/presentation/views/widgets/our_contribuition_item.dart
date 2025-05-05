import 'package:blood_bank/core/functions/is_dark_mode.dart';
import 'package:flutter/material.dart';

import '../../../data/models/contribution_model.dart';

class OurContributionsItem extends StatelessWidget {
  const OurContributionsItem({
    super.key,
    required this.contributionModel,
  });
  final ContributionModel contributionModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            spacing: 8,
            children: [
              Text(
                contributionModel.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: contributionModel.textColor),
              ),
              Text(
                "Blood Donner",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: isDarkMode(context)
              ? Theme.of(context).colorScheme.surface
              : contributionModel.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
