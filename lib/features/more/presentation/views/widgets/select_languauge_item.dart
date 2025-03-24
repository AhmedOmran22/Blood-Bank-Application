import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectLanguageItem extends StatelessWidget {
  const SelectLanguageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: .5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Radio<Locale>(
                    value: const Locale('en'),
                    groupValue: context.locale,
                    onChanged: (value) {
                      context.setLocale(value!);
                    },
                  ),
                  const Text("English"),
                ],
              ),
              const Divider(
                thickness: .5,
                color: Colors.grey,
              ),
              Row(
                children: [
                  Radio<Locale>(
                    value: const Locale('ar'),
                    groupValue: context.locale,
                    onChanged: (value) {
                      context.setLocale(value!);
                    },
                  ),
                  const Text("العربية"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
