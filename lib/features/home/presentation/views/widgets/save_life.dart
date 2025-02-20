import 'package:flutter/material.dart';

class SaveLife extends StatelessWidget {
  const SaveLife({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.of(context).size.height * .15,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: const Row(
          children: [],
        ),
      ),
    );
  }
}
