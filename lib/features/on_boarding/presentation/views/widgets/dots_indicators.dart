import 'package:blood_bank/core/utils/app_colors.dart';
import 'package:blood_bank/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotsIndicators extends StatelessWidget {
  const DotsIndicators({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: onBoardingModels.length,
      axisDirection: Axis.horizontal,
      effect: ExpandingDotsEffect(
        spacing: 8.0,
        radius: 60,
        dotWidth: 8,
        dotHeight: 10.0,
        dotColor: AppColors.primaryColor.withAlpha(128),
        activeDotColor: AppColors.primaryColor,
      ),
    );
  }
}
