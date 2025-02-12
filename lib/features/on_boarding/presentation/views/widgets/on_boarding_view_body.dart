import 'package:blood_bank/features/on_boarding/presentation/views/widgets/dots_indicators.dart';
import 'package:flutter/material.dart';

import 'on_boarding_button.dart';
import 'on_boarding_page_view.dart';
import 'skip_widget.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnBoardingPageView(controller: controller),
        Positioned.fill(
          top: MediaQuery.of(context).size.height * .70,
          child: Align(
            alignment: Alignment.center,
            child: DotsIndicators(
              controller: controller,
            ),
          ),
        ),
        OnBoardingButton(controller: controller),
        SkipWidget(controller: controller)
      ],
    );
  }
}
