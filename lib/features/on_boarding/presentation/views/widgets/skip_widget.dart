import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned.directional(
      textDirection: Directionality.of(context),
      end: 20,
      top: 50,
      child: Visibility(
        visible: !(controller.hasClients && controller.page == 2),
        child: InkWell(
          onTap: () {
            Prefs.setBool(kIsOnBoardingViewed, true);
            Navigator.pushNamed(context, AppRoutes.registerOrLogin);
          },
          splashColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'skip',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(),
            ).tr(),
          ),
        ),
      ),
    );
  }
}
