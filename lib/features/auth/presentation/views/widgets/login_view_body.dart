import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assets.dart';
import 'do_not_have_an_account.dart';
import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .1),
            SvgPicture.asset(
              AppAssets.imagesBloodDonation,
              height: MediaQuery.of(context).size.height * .3,
            ),
            const SizedBox(height: 16),
            Text(
              "Login",
              style: Theme.of(context).textTheme.bodyLarge,
            ).tr(),
            const SizedBox(height: 16),
            const LoginForm(),
            const DoNotHaveAnAccount(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
