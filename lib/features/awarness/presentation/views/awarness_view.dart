import 'package:blood_bank/features/awarness/presentation/views/widgets/awarness_view_body.dart';
import 'package:flutter/material.dart';

class AwarnessView extends StatelessWidget {
  const AwarnessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Awarness",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: AwarnessViewBody(),
      ),
    );
  }
}
