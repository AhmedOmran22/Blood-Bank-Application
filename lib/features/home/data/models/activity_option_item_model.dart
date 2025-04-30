import 'package:blood_bank/core/routes/app_routes.dart';

class ActivityOptionItemModel {
  final String title;
  final String subtitle;
  final String navigateTo;

  ActivityOptionItemModel({
    required this.title,
    required this.subtitle,
    required this.navigateTo,
  });
}

List<ActivityOptionItemModel> activityOptionItems = [
  ActivityOptionItemModel(
    title: 'Blood Donors',
    subtitle: '120 donors',
    navigateTo: AppRoutes.bloodDonors,
  ),
  ActivityOptionItemModel(
    title: 'Request Blood',
    subtitle: 'Get help',
    navigateTo: AppRoutes.requestBlood,
  ),
  ActivityOptionItemModel(
    title: 'Create Post',
    subtitle: "It's easy 1 step",
    navigateTo: AppRoutes.sendPost,
  ),
  ActivityOptionItemModel(
    title: 'Blood Given',
    subtitle: "It's easy 1 step",
    navigateTo: AppRoutes.bloodGiven,
  ),
];
