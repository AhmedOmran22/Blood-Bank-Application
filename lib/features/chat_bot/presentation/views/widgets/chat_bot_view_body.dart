import 'package:blood_bank/features/chat_bot/presentation/views/widgets/user_chat_bubble.dart';
import 'package:flutter/material.dart';

import '../../../data/models/message_model.dart';

class ChatBotViewBody extends StatelessWidget {
  const ChatBotViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserChatBubble(messageModel: MessageModel(message: "Hello", id: "1")),
      ],
    );
  }
}
