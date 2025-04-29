import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/general_button.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.05,
      right: 10,
      left: 10,
      child: GeneralButton(
        onPressed: () {
          if (controller.page == 2) {
            Prefs.setBool(kIsOnBoardingViewed, true);
            Navigator.pushNamed(context, AppRoutes.registerOrLogin);
          } else {
            controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          }
        },
        text: controller.hasClients && controller.page == 2
            ? "Get Started"
            : 'next',
        backgroundColor: AppColors.primaryColor,
        textColor: AppColors.whiteColor,
      ),
    );
  }
}
