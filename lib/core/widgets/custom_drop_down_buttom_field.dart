import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  const CustomDropdownButtonFormField({
    super.key,
    required this.onChanged,
   required this.items,
    this.hintText,
  });
  final void Function(String?) onChanged;
  final List<DropdownMenuItem<String>> items;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: (value) {
        if (value == null) {
          return 'Field is required'.tr();
        }
        return null;
      },
      hint: Text(
        hintText?.tr() ?? 'Type of Blood'.tr(),
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.grey, fontSize: 14),
      ),
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
      items: items,
      onChanged: onChanged,
    );
  }
}
