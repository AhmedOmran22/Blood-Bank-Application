import 'package:blood_bank/features/more/presentation/views/widgets/settings_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings".tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SetingsViewBody(),
      ),
    );
  }
}
