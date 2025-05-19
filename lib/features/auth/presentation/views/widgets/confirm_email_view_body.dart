import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/features/auth/presentation/cubits/confiem_email_cubit/confirm_email_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/general_button.dart';

class confirmEmailViewBody extends StatefulWidget {
  const confirmEmailViewBody({super.key});
  static final String userEmail = Prefs.getString("userEmail")!;

  @override
  State<confirmEmailViewBody> createState() => _confirmEmailViewBodyState();
}

class _confirmEmailViewBodyState extends State<confirmEmailViewBody> {
  late TextEditingController codeController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
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
                      "Enter the code sent to ${Prefs.getString(kConfirmedUserEmail)}",
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ).tr(),
                  ),
                ],
              ),
              const SizedBox(height: 32),
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
              const SizedBox(height: 32),
              GeneralButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<ConfirmEmailCubit>().confirmEmail(
                          email: Prefs.getString(kConfirmedUserEmail)!,
                          code: codeController.text,
                        );
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: "Verify Code",
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
              ),
              const SizedBox(height: 16),
              GeneralButton(
                onPressed: () {
                  context.read<ConfirmEmailCubit>().resendCode();
                },
                text: "Resend Code",
                textColor: AppColors.primaryColor,
                backgroundColor:
                    Theme.of(context).brightness == Brightness.light
                        ? AppColors.whiteColor
                        : const Color(0xFF121212),
              ),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}
