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
    title: 'Appointment',
    subtitle: '120 donors',
    navigateTo: AppRoutes.appointmentView,
  ),
  ActivityOptionItemModel(
    title: 'Can Donate ?',
    subtitle: 'Get help',
    navigateTo: AppRoutes.predictView,
  ),
  ActivityOptionItemModel(
    title: 'Create Post',
    subtitle: "It's easy 1 step",
    navigateTo: AppRoutes.sendPost,
  ),
  ActivityOptionItemModel(
    title: 'Recommended',
    subtitle: "It's easy 1 step",
    navigateTo: AppRoutes.recommendedView,
  ),
];
