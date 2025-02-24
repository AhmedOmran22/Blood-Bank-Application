import 'package:blood_bank/features/awarness/data/models/question_and_answer_model.dart';
import 'package:flutter/material.dart';

class QuestionAndAnswerItem extends StatelessWidget {
  const QuestionAndAnswerItem({
    super.key,
    required this.questionAndAnswerModel,
  });
  final QuestionAndAnswerModel questionAndAnswerModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionAndAnswerModel.question,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          questionAndAnswerModel.answer,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w100,
              ),
        ),
        const SizedBox(height: 16),
        Divider(color: Colors.grey.shade600, thickness: 1),
        const SizedBox(height: 16),
      ],
    );
  }
}
