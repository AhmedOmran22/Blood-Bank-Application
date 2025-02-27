import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/features/chat_bot/presentation/views/widgets/messages_list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/models/message_model.dart';

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
      children: [
        Expanded(
          child: MessagesListViewBuilder(
            messages: messages,
          ),
        ),
        CustomTextFormField(
          controller: messageController,
          suffixIcon: const Icon(FontAwesomeIcons.solidPaperPlane),
        ),
      ],
    );
  }
}
