import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:blood_bank/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1))
        .then((value) => Navigator.pushReplacementNamed(
              context,
              _handleInitialRoute(),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(AppAssets.imagesLogo),
    );
  }

  String _handleInitialRoute() {
    if (Prefs.getString(kToken) != null) {
      return AppRoutes.bottomNavigationBarView;
    }
    if (Prefs.getString(kConfirmedUserEmail) != null) {
      return AppRoutes.confirmEmail;
    }
    if (Prefs.getBool(kIsOnBoardingViewed)) {
      return AppRoutes.login;
    }
    return AppRoutes.onBoarding;
  }
}
