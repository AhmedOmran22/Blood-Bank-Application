import 'package:blood_bank/features/home/presentation/views/widgets/home_sliver_app_bar.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/save_life.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        HomeSliverAppBar(),
        SliverPadding(
          padding: EdgeInsets.only(
            top: 24,
            left: 16,
            right: 16,
          ),
          sliver: SaveLife(),
        ),
      ],
    );
  }
}
