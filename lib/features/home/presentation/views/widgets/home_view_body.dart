import 'package:blood_bank/core/utils/app_assets.dart';
import 'package:blood_bank/core/utils/app_colors.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/home_sliver_app_bar.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/save_life.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/sliver_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const HomeSliverAppBar(),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        const SaveLife(),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        const SliverText(text: "activity as "),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * .1,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primaryColor,
                width: .5,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.imagesDonateBlood,
                ),
                const Column(
                  spacing: 4,
                  children: [
                    Text("Blood Donor"),
                    Text("120 Post"),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
//0xFFF8F8F8
