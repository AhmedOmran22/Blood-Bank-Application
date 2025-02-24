import 'package:blood_bank/features/awarness/presentation/views/widgets/questions_and_answres_list_view.dart';
import 'package:blood_bank/core/widgets/save_life_widget.dart';
import 'package:flutter/material.dart';

class AwarnessViewBody extends StatelessWidget {
  const AwarnessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SaveLifeWidget(),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        QusetionsAndAnswersListView(),
      ],
    );
  }
}
