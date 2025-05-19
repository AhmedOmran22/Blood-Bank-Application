import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserChatBubble extends StatelessWidget {
  const UserChatBubble({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: context.locale.languageCode == "en"
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: context.locale.languageCode == "en"
              ? const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Text(
          message.replaceFirst(RegExp(r'^(You:|Bot:)\s*'), ''),
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(letterSpacing: -.5, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
