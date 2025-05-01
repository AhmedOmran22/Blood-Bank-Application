import 'package:blood_bank/features/awarness/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:blood_bank/features/awarness/presentation/views/widgets/awarneww_info_sliver_list.dart';
import 'package:flutter/material.dart';

class AwarnessViewBody extends StatelessWidget {
  const AwarnessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: CustomCarouselSlider(),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        AwarnessInfoSliverList(),
      ],
    );
  }
}
