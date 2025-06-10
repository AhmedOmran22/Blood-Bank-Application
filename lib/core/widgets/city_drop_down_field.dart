import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CityDropDownField extends StatelessWidget {
  const CityDropDownField({
    super.key,
    required this.onChanged,
    this.hintText,
  });

  static final List<Map<String, dynamic>> cities = [
    {"id": 1, "name": "Cairo"},
    {"id": 2, "name": "Giza"},
    {"id": 3, "name": "Alexandria"},
    {"id": 4, "name": "Dakahlia"},
    {"id": 5, "name": "Red Sea"},
    {"id": 6, "name": "Beheira"},
    {"id": 7, "name": "Fayoum"},
    {"id": 8, "name": "Gharbia"},
    {"id": 9, "name": "Ismailia"},
    {"id": 10, "name": "Monufia"},
    {"id": 11, "name": "Minya"},
    {"id": 12, "name": "Qalyubia"},
    {"id": 13, "name": "New Valley"},
    {"id": 14, "name": "Suez"},
    {"id": 15, "name": "Aswan"},
    {"id": 16, "name": "Assiut"},
    {"id": 17, "name": "Beni Suef"},
    {"id": 18, "name": "Port Said"},
    {"id": 19, "name": "Damietta"},
    {"id": 20, "name": "Sharqia"},
    {"id": 21, "name": "South Sinai"},
    {"id": 22, "name": "Kafr El Sheikh"},
    {"id": 23, "name": "Matrouh"},
    {"id": 24, "name": "Luxor"},
    {"id": 25, "name": "Qena"},
    {"id": 26, "name": "North Sinai"},
    {"id": 27, "name": "Sohag"}
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
        hintText?.tr() ?? 'Select City'.tr(),
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.grey, fontSize: 14),
      ),
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
      items: cities.map((city) {
        return DropdownMenuItem<int>(
          value: city['id'],
          child: Text(city['name']).tr(),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}