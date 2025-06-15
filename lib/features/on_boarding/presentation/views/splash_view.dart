import 'package:flutter/material.dart';

import 'widgets/language_and_theme_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SplashViewBody(),
      ),
    );
  }
}
