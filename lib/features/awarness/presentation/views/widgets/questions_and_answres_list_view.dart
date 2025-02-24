import 'package:blood_bank/features/awarness/presentation/views/widgets/question_and_answer_item.dart';
import 'package:flutter/material.dart';

import '../../../data/models/question_and_answer_model.dart';

class QusetionsAndAnswersListView extends StatelessWidget {
  const QusetionsAndAnswersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: questionAndAnswerModels.length,
      itemBuilder: (context, index) {
        return QuestionAndAnswerItem(
          questionAndAnswerModel: questionAndAnswerModels[index],
        );
      },
    );
  }
}
