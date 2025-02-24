import 'package:blood_bank/features/home/presentation/views/widgets/activity_options_grid.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/blood_groups.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/home_sliver_app_bar.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/posts_and_see_all_row.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/posts_sliver_list.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/save_life_widget.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/sliver_text.dart';
import 'package:flutter/material.dart';

import 'our_contributions_grid.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        HomeSliverAppBar(),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SaveLifeWidget(),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverText(text: "Activity As "),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: ActivityOptions()),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverText(text: "Blood Groups"),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: BloodGroups()),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: PostsAndSeeAllRow(),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        PostsSliverList(childCount: 2),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverText(text: "Our Contributions"),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: OurContributionsGrid()),
      ],
    );
  }
}
