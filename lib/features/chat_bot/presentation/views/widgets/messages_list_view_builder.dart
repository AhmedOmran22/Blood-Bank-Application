import 'package:blood_bank/features/chat_bot/data/models/message_model.dart';
import 'package:flutter/material.dart';

import 'chat_bot_bubble.dart';
import 'user_chat_bubble.dart';

class MessagesListViewBuilder extends StatelessWidget {
  const MessagesListViewBuilder({
    super.key,
    required this.messages,
  });
  final List<MessageModel> messages;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int index) {
        if (messages[index].id == "1") {
          return UserChatBubble(messageModel: messages[index]);
        } else {
          return ChatBotBubble(messageModel: messages[index]);
        }
      },
    );
  }
}
