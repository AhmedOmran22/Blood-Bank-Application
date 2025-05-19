import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
    this.hintText,
    this.controller,
    this.textInputType = TextInputType.text,
    this.validator,
  });
  final String? hintText;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            isPasswordVisible = !isPasswordVisible;
            setState(() {});
          },
          icon: isPasswordVisible
              ? Icon(
                  Icons.visibility,
                  color: AppColors.greyColor.withAlpha(128),
                )
              : Icon(
                  Icons.visibility_off,
                  color: AppColors.greyColor.withAlpha(128),
                ),
        ),
        hintText: widget.hintText!.tr(),
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.grey,
              fontSize: 14,
            ),
        border: Theme.of(context).inputDecorationTheme.border,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
      ),
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
      cursorColor: AppColors.primaryColor,
      obscureText: isPasswordVisible,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      validator: widget.validator,
      onSaved: widget.onSaved,
    );
  }
}
