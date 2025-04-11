import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "do not have an account? ".tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, AppRoutes.register);
              },
            text: "create an account".tr(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
