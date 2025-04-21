import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/general_button.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .05),
          Row(
            children: [
              Expanded(
                child: Text(
                  textAlign: TextAlign.start,
                  "do not worry, just enter your phone number and we will send you a code to reset your password",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ).tr(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const CustomTextFormField(
            hitnText: "phone number",
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 32),
          GeneralButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.confirmEmail);
            },
            text: "Forget Password",
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }
}
