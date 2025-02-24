import 'package:blood_bank/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';

class BloodTypeWidget extends StatelessWidget {
  const BloodTypeWidget({super.key, required this.bloodType});
  final String bloodType;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            SvgPicture.asset(
              AppAssets.imagesBloodDropRed,
              height: 48,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  bloodType,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
