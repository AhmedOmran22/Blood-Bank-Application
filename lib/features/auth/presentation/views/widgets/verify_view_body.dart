import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/general_button.dart';

class VerifyViewBody extends StatelessWidget {
  const VerifyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .05),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Enter the code sent to your phone number",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ).tr(),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const CustomTextFormField(
            hitnText: "Enter the code",
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 32),
          GeneralButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.resetPassword);
            },
            text: "Verify Code",
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
          ),
          const SizedBox(height: 16),
          GeneralButton(
            onPressed: () {},
            text: "Resend Code",
            textColor: AppColors.primaryColor,
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.whiteColor
                : const Color(0xFF121212),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
