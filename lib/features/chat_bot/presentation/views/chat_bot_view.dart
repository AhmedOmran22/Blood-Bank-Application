import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/features/chat_bot/data/repos/chat_repo_imple.dart';
import 'package:blood_bank/features/chat_bot/presentation/views/widgets/messages_list_view_builder.dart';
import 'package:blood_bank/features/chat_bot/presentation/views/widgets/start_conservation_widget.dart';
import 'package:flutter/material.dart';

class ChatBotView extends StatefulWidget {
  const ChatBotView({super.key});

  @override
  State<ChatBotView> createState() => _ChatBotViewState();
}

class _ChatBotViewState extends State<ChatBotView> {
  final ChatRepository _chatRepo = ChatRepository();
  final List<String> _messages = [];
  late TextEditingController _controller;
  late ScrollController _scrollController;
  bool isBotTyping = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _controller = TextEditingController();
    _chatRepo.connect();
    _chatRepo.messagesStream.listen((msg) {
      setState(() {
        _messages.add(msg);
        isBotTyping = false;
      });
    });
    super.initState();
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    _chatRepo.sendMessage(_controller.text);
    _controller.clear();
  }

  @override
  void dispose() {
    _chatRepo.dispose();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Bot"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? const StartConversation()
                : MessageListViewBuilder(
                    scrollController: _scrollController,
                    messages: _messages,
                    isBotTyping: isBotTyping),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: _controller,
                    maxLines: 1,
                    textInputType: TextInputType.text,
                    hitnText: "Type a message...",
                    onSaved: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage();
                    isBotTyping = true;
                    _messages.isNotEmpty
                        ? _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          )
                        : null;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
