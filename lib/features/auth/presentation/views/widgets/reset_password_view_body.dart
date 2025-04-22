import 'package:blood_bank/core/functions/show_snack_bar_function.dart';
import 'package:blood_bank/core/utils/app_regex.dart';
import 'package:blood_bank/features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/general_button.dart';
import '../../../../../core/widgets/password_field.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode auroValidateMode = AutovalidateMode.disabled;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController codeController;

  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: auroValidateMode,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            CustomTextFormField(
              hitnText: "Enter the code",
              controller: codeController,
              textInputType: TextInputType.number,
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return "Field is required".tr();
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            PasswordField(
              controller: passwordController,
              hintText: "New Password",
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return "Field is required".tr();
                } else if (!AppRegex.hasMinLength(data)) {
                  return "password must contain at least 8 characters".tr();
                } else if (!AppRegex.hasUpperCase(data)) {
                  return "password must contain at least one uppercase letter"
                      .tr();
                } else if (!AppRegex.hasNumber(data)) {
                  return "password must contain at least one number".tr();
                } else if (!AppRegex.hasSpecialCharacter(data)) {
                  return "password must contain at least one special character"
                      .tr();
                } else if (!AppRegex.hasLowerCase(data)) {
                  return "password must contain at least one lowercase letter"
                      .tr();
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            PasswordField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
            ),
            const SizedBox(height: 32),
            GeneralButton(
              text: "Reset Password",
              height: 60,
              backgroundColor: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (passwordController.text ==
                      confirmPasswordController.text) {
                    context.read<ForgotAndResetPasswordCubit>().resetPassword(
                          password: passwordController.text,
                          code: codeController.text,
                        );
                  } else {
                    showSnackBarFuction(context, "Passwords do not match");
                  }
                  formKey.currentState!.save();
                } else {
                  auroValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
