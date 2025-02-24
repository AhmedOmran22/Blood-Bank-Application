import 'package:flutter/material.dart';

import 'widgets/send_post_view_body.dart';

class SendPostView extends StatelessWidget {
  const SendPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SendPostViewBody(),
    );
  }
}
