import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_assets.dart';

class SaveLifeWidget extends StatelessWidget {
  const SaveLifeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.of(context).size.height * .15,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Save a Life",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(letterSpacing: 1, fontSize: 20),
                ).tr(),
                Text(
                  "Give Blood",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(letterSpacing: 1, fontSize: 20),
                ).tr(),
              ],
            ),
            SvgPicture.asset(
              AppAssets.imagesBloodDonation,
              height: MediaQuery.of(context).size.height * .12,
            )
          ],
        ),
      ),
    );
  }
}
