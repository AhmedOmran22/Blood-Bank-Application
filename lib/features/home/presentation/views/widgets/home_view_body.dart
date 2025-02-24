import 'package:blood_bank/features/home/presentation/views/widgets/activity_options_grid.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/blood_groups.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/home_sliver_app_bar.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/save_life_widget.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/sliver_text.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const HomeSliverAppBar(),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SaveLifeWidget(),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverText(text: "Activity As "),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverToBoxAdapter(child: ActivityOptions()),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverText(text: "Blood Groups"),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverToBoxAdapter(child: BloodGroups()),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  "Posts",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(letterSpacing: 1, fontSize: 18),
                ),
                const Spacer(),
                Text(
                  "See All",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(letterSpacing: 1, fontSize: 18),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
