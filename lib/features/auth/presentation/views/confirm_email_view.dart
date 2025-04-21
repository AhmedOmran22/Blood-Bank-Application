import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'widgets/confirm_email_view_body.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Verify Account",
          style: Theme.of(context).textTheme.bodyLarge,
        ).tr(),
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: confirmEmailViewBody(),
      ),
    );
  }
}
