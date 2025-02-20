import 'package:blood_bank/features/home/presentation/views/widgets/blood_type_widget.dart';
import 'package:flutter/material.dart';

class BloodGroups extends StatelessWidget {
  const BloodGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BloodTypeWidget(),
              BloodTypeWidget(),
              BloodTypeWidget(),
              BloodTypeWidget(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BloodTypeWidget(),
              BloodTypeWidget(),
              BloodTypeWidget(),
              BloodTypeWidget(),
            ],
          )
        ],
      ),
    );
  }
}
