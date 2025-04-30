import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:blood_bank/features/auth/presentation/cubits/forgot_and_reset_password_cubit/forgot_and_reset_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_regex.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/general_button.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  late TextEditingController emailController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Row(
              children: [
                Expanded(
                  child: Text(
                    textAlign: TextAlign.start,
                    "do not worry, just enter your Email and we will send you a code to reset your password",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ).tr(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: emailController,
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return "Field is required".tr();
                } else if (!AppRegex.isEmailValid(data)) {
                  return "Invalid email".tr();
                }
                return null;
              },
              // controller: emailController,
              hitnText: "Email Address",
            ),
            const SizedBox(height: 32),
            GeneralButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  Prefs.setString(kForgotPasswordEmail, emailController.text);
                  context
                      .read<ForgotAndResetPasswordCubit>()
                      .forgotPassword(email: emailController.text);
                  Prefs.setString(kForgotPasswordEmail, emailController.text);
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: "Forget Password",
              backgroundColor: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
