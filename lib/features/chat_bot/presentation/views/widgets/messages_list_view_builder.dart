
import 'package:blood_bank/features/chat_bot/presentation/views/widgets/chat_bot_bubble.dart';
import 'package:blood_bank/features/chat_bot/presentation/views/widgets/user_chat_bubble.dart';
import 'package:flutter/material.dart';

class MessageListViewBuilder extends StatelessWidget {
  const MessageListViewBuilder({
    super.key,
    required ScrollController scrollController,
    required List<String> messages,
    required this.isBotTyping,
  })  : _scrollController = scrollController,
        _messages = messages;

  final ScrollController _scrollController;
  final List<String> _messages;
  final bool isBotTyping;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(12),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final msg = _messages[index];
        final isMe = msg.startsWith("You:");

        return isBotTyping && index == _messages.length - 1
            ? const ChatBotBubble(message: "Typing...")
            : isMe
                ? UserChatBubble(message: msg)
                : ChatBotBubble(message: msg);
      },
    );
  }
}
