import 'package:flutter/material.dart';

import 'widgets/send_post_view_body.dart';

class SendPostView extends StatelessWidget {
  const SendPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Send Post",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const SendPostViewBody(),
    );
  }
}
