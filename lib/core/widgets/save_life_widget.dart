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
            Text(
              "Save a Life\nGive Blood",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(letterSpacing: 1, fontSize: 20),
            ),
            SvgPicture.asset(
              AppAssets.imagesAnotherTesting,
              height: MediaQuery.of(context).size.height * .12,
            )
          ],
        ),
      ),
    );
  }
}
