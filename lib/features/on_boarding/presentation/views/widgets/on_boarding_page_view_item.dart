import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/models/on_boarding_model.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem({
    super.key,
    required this.onBoardingModel,
  });
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .15),
          SvgPicture.asset(
            height: 270,
            onBoardingModel.image,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            onBoardingModel.title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ).tr(),
          const SizedBox(
            height: 12,
          ),
          Text(
            onBoardingModel.subtitle,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ).tr(),
          SizedBox(height: MediaQuery.of(context).size.height * .25),
        ],
      ),
    );
  }
}
