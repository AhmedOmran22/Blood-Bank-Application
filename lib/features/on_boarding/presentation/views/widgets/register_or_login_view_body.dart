import 'package:blood_bank/features/on_boarding/presentation/views/widgets/top_register_or_login_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/general_button.dart';

class RegisterOrLoginViewBody extends StatelessWidget {
  const RegisterOrLoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          const TopRegisterRoLoginSection(),
          SizedBox(height: MediaQuery.of(context).size.height * .05),

          SvgPicture.asset(
            height: 270,
            AppAssets.imagesBloodDonation,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .1),

          GeneralButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
            text: "Login",
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
          ),
          const SizedBox(height: 15),
          //? I put container to give the button border color
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primaryColor, width: 1),
            ),
            child: GeneralButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.register);
              },
              text: "Register",
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? AppColors.whiteColor
                  : const Color(0xFF121212),
              textColor: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
