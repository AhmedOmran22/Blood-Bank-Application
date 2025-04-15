import 'package:blood_bank/features/home/presentation/views/widgets/donors_view_body.dart';
import 'package:flutter/material.dart';

class DonorsView extends StatelessWidget {
  const DonorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold
    (
      body: DonorsViewBody(),
    );
  }
}
