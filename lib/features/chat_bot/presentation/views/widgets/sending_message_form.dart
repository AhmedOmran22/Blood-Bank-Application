import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class SendingMessageForm extends StatelessWidget {
  const SendingMessageForm({
    super.key,
    required this.messageController,
  });

  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: CustomTextFormField(
            hitnText: "Type a message to chat bot",
            controller: messageController,
            maxLines: 1,
          ),
        ),
        IconButton(
          splashColor: AppColors.primaryColor.withAlpha(128),
          icon: const Icon(
            Icons.send_sharp,
            color: AppColors.primaryColor,
            size: 28,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
