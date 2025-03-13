import 'package:easy_localization/easy_localization.dart';

class ActivityOptionItemModel {
  final String title;
  final String subtitle;

  ActivityOptionItemModel({
    required this.title,
    required this.subtitle,
  });
}
List<ActivityOptionItemModel> activityOptionItems = [
  ActivityOptionItemModel(
    title: 'Blood Donor'.tr(),
    subtitle: '120 Post'.tr(),
  ),
  ActivityOptionItemModel(
    title: 'Request Blood'.tr(),
    subtitle: 'Get help'.tr(),
  ),
  ActivityOptionItemModel(
    title: 'Create Post'.tr(),
    subtitle: "It's easy 1 step".tr(),
  ),
  ActivityOptionItemModel(
    title: 'Blood Given'.tr(),
    subtitle: "It's easy 1 step".tr(),
  ),
];
