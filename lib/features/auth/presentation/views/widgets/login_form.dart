import 'package:blood_bank/core/utils/app_regex.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/general_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/password_field.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import 'foreget_password_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            hitnText: "Email Address",
            textInputType: TextInputType.emailAddress,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return "Field is required".tr();
              } else if (!AppRegex.isEmailValid(data)) {
                return "Invalid email".tr();
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          PasswordField(
            controller: passwordController,
            hintText: "Password",
          ),
          const SizedBox(height: 16),
          const ForgetPasswordWidget(),
          const SizedBox(height: 16),
          GeneralButton(
            text: "Login",
            height: 60,
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<LoginCubit>().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              } else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
