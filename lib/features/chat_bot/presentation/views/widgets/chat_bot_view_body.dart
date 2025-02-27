import 'package:blood_bank/features/chat_bot/presentation/views/widgets/messages_list_view_builder.dart';
import 'package:flutter/material.dart';

import '../../../data/models/message_model.dart';
import 'sending_message_form.dart';

class ChatBotViewBody extends StatefulWidget {
  const ChatBotViewBody({super.key});

  @override
  State<ChatBotViewBody> createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  late TextEditingController messageController;

  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Expanded(
          child: MessagesListViewBuilder(
            messages: messages,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: SendingMessageForm(messageController: messageController),
        ),
      ],
    );
  }
}
