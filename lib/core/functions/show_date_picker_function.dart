import "package:flutter/material.dart";

Future<DateTime?> ShowDatePickerFunction(BuildContext context) {
  return showDatePicker(
    cancelText: "Cancel",
    confirmText: "Confirm",
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(
      2026,
      12,
      31,
    ),
  );
}
