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
    title: 'Blood Donor',
    subtitle: '120 Post',
  ),
  ActivityOptionItemModel(
    title: 'Request Blood',
    subtitle: 'Get help',
  ),
  ActivityOptionItemModel(
    title: 'Create Post',
    subtitle: 'It\'s easy 1 step',
  ),
  ActivityOptionItemModel(
    title: 'Blood Given',
    subtitle: 'It\'s easy 1 step',
  ),
];
