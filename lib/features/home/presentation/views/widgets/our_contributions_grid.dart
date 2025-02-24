import 'package:blood_bank/features/home/presentation/views/widgets/our_contribuition_item.dart';
import 'package:flutter/material.dart';
class OurContributionsGrid extends StatelessWidget {
  const OurContributionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              OurContributionsItem(),
              OurContributionsItem(),
              OurContributionsItem()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              OurContributionsItem(),
              OurContributionsItem(),
              OurContributionsItem()
            ],
          ),
        ],
      ),
    );
  }
}