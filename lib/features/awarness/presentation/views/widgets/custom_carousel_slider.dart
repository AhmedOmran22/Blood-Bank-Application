
import 'package:blood_bank/core/utils/app_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Image.asset(AppAssets.imagesAwarness1),
        Image.asset(AppAssets.imagesAwarness2),
        Image.asset(AppAssets.imagesAwarness3),
      ],
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: .95,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 2400),
        autoPlayCurve: Curves.easeInOut,
        initialPage: 0,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
