import 'package:blood_bank/core/utils/app_colors.dart';
import 'package:blood_bank/features/awarness/data/models/blood_awarness_info_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AwarnessInfoItem extends StatelessWidget {
  const AwarnessInfoItem({
    super.key,
    required this.bloodAwarmessInfoModel,
  });
  final BloodAwarnessInfoModel bloodAwarmessInfoModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bloodAwarmessInfoModel.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.primaryColor,
              ),
        ).tr(),
        Text(
          bloodAwarmessInfoModel.subtitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 15,
                color: Colors.grey,
              ),
        ).tr(),
      ],
    );
  }
}
