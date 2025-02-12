import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.forgetPassword);
            },
            child: Text(
              textAlign: TextAlign.start,
              "Forget Password?",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 14,
                  ),
            ).tr(),
          ),
        ),
      ],
    );
  }
}
