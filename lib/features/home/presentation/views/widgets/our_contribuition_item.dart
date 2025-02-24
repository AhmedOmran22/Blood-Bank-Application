import 'package:flutter/material.dart';
class OurContributionsItem extends StatelessWidget {
  const OurContributionsItem(
      {super.key, this.backGroundColor = Colors.greenAccent});

  final Color? backGroundColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            spacing: 8,
            children: [
              Text(
                "1k+",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black),
              ),
              Text(
                "Blood Donner",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
