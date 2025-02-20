import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assets.dart';

class SaveLife extends StatelessWidget {
  const SaveLife({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
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
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    letterSpacing: 1,
                  ),
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
