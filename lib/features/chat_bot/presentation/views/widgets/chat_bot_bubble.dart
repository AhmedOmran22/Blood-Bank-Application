import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../data/models/message_model.dart';

class ChatBotBubble extends StatelessWidget {
  const ChatBotBubble({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: context.locale.languageCode == "en"
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: context.locale.languageCode == "en"
              ? const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Text(
          messageModel.message,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(letterSpacing: -.5, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
