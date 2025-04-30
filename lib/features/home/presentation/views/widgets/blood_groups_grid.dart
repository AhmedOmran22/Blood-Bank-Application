import 'package:blood_bank/features/home/presentation/views/widgets/blood_type_widget.dart';
import 'package:flutter/material.dart';

class BloodGroupsGrid extends StatelessWidget {
  const BloodGroupsGrid({super.key});
  static final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 2.4),
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: bloodTypes.length,
        itemBuilder: (context, index) => BloodTypeWidget(
          bloodType: bloodTypes[index],
        ),
      ),
    );
  }
}
