import 'package:blood_bank/features/home/presentation/views/widgets/our_contribuition_item.dart';
import 'package:flutter/material.dart';

import '../../../data/models/contribution_model.dart';

class OurContributionsGrid extends StatelessWidget {
  const OurContributionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              OurContributionsItem(
                contributionModel: contributionModels[0],
              ),
              OurContributionsItem(
                contributionModel: contributionModels[1],
              ),
              OurContributionsItem(
                contributionModel: contributionModels[2],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              OurContributionsItem(
                contributionModel: contributionModels[3],
              ),
              OurContributionsItem(
                contributionModel: contributionModels[4],
              ),
              OurContributionsItem(
                contributionModel: contributionModels[5],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
