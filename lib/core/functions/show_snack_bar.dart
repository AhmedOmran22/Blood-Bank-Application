import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
      ).tr(),
    ),
  );
}
