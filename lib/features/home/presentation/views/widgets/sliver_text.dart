import 'package:flutter/material.dart';

class SliverText extends StatelessWidget {
  const SliverText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(letterSpacing: 1, fontSize: 18),
        ),
      ),
    );
  }
}
