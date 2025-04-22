
import 'package:flutter/material.dart';

class StartConversation extends StatelessWidget {
  const StartConversation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Let\'s start a conversation',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
