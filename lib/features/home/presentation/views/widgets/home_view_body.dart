import 'package:blood_bank/features/home/presentation/views/widgets/activity_options_grid.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/blood_groups.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/home_sliver_app_bar.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/save_life.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/sliver_text.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        HomeSliverAppBar(),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SaveLife(),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverText(text: "activity as "),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        ActivityOptionsGrid(),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverText(text: "Blood Groups"),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        BloodGroupsGrid(),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverText(text: "Recently Reviewed"),
        SliverToBoxAdapter
        (
          
        ),
      ],
    );
  }
}
