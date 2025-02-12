import 'package:blood_bank/core/utils/app_assets.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<OnBoardingModel> onBoardingModels = [
  OnBoardingModel(
    image: AppAssets.imagesAnotherTesting,
    title: 'Save a Life',
    subtitle:
        'Your blood donation can save someone in desperate need. Every drop counts!',
  ),
  OnBoardingModel(
    image: AppAssets.imagesAnotherTesting,
    title: 'Simple Act, Big Impact',
    subtitle:
        'Donating blood is a quick and safe process, but its impact on patients’ lives is huge.',
  ),
  OnBoardingModel(
    image: AppAssets.imagesAnotherTesting,
    title: 'Join Our Community',
    subtitle:
        'Be part of a life saving community! Together, we can make a difference and help those in need.',
  ),
];
