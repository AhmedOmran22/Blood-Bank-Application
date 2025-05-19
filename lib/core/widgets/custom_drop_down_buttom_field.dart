import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BloodTypeDropDownField extends StatelessWidget {
  const BloodTypeDropDownField({
    super.key,
    required this.onChanged,
    this.hintText,
  });
  static final List<String> bloodTypes = [
    "O+",
    "O-",
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
  ];

  final void Function(int?) onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
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
      items: List.generate(
        bloodTypes.length,
        (index) => DropdownMenuItem(
          value: index + 1,
          child: Text(bloodTypes[index]),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
