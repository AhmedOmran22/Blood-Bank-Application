import 'package:blood_bank/features/chat_bot/presentation/views/widgets/chat_bot_view_body.dart';
import 'package:flutter/material.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chat Bot",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ChatBotViewBody()),
    );
  }
}
