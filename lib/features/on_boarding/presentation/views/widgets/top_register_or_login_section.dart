import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TopRegisterRoLoginSection extends StatelessWidget {
  const TopRegisterRoLoginSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "lets start",
          style: Theme.of(context).textTheme.displayLarge,
        ).tr(),
        const SizedBox(height: 15),
        Text(
          textAlign: TextAlign.center,
          "create an account or login to continue",
          style: Theme.of(context).textTheme.titleMedium,
        ).tr()
      ],
    );
  }
}
