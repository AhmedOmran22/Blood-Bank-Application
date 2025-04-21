import 'dart:developer';

import 'package:blood_bank/core/widgets/custom_drop_down_buttom_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/show_snack_bar_function.dart';
import '../../../../../core/utils/app_regex.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/general_button.dart';
import '../../../../../core/widgets/password_field.dart';
import '../../cubits/register_cubit/register_cubit.dart';
import 'terms_and_conditions.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isTermsAccepted = false;
  int? bloodType;
  String? gender;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;
  late TextEditingController nationalIDController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    nationalIDController = TextEditingController();
    phoneController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    nationalIDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        spacing: 16,
        children: [
          buildFullNameField(),
          buildEmailField(),
          buildPhoneNumberField(),
          buildNationalIDField(),
          buildDropDownBloodTypesField(),
          buildPasswordField(),
          buildConfirmPasswordField(),
          TermsAndConditions(
            onChanged: (bool value) {
              setState(
                () {
                  isTermsAccepted = value;
                },
              );
            },
          ),
          GeneralButton(
            onPressed: () async {
              await handlingRegister(context);
            },
            text: "Create New Account",
            backgroundColor:
                isTermsAccepted ? AppColors.primaryColor : AppColors.greyColor,
            textColor: AppColors.whiteColor,
          )
        ],
      ),
    );
  }

  PasswordField buildConfirmPasswordField() {
    return PasswordField(
      controller: confirmPasswordController,
      hintText: "Confirm Password",
    );
  }

  PasswordField buildPasswordField() {
    return PasswordField(
      controller: passwordController,
      hintText: "Password",
      validator: (data) {
        if (data == null || data.isEmpty) {
          return "Field is required".tr();
        } else if (!AppRegex.hasMinLength(data)) {
          return "password must contain at least 8 characters".tr();
        } else if (!AppRegex.hasUpperCase(data)) {
          return "password must contain at least one uppercase letter".tr();
        } else if (!AppRegex.hasNumber(data)) {
          return "password must contain at least one number".tr();
        } else if (!AppRegex.hasSpecialCharacter(data)) {
          return "password must contain at least one special character".tr();
        } else if (!AppRegex.hasLowerCase(data)) {
          return "password must contain at least one lowercase letter".tr();
        }
        return null;
      },
    );
  }

  CustomTextFormField buildNationalIDField() {
    return CustomTextFormField(
      validator: (data) {
        if (data == null || data.isEmpty) {
          return "Field is required".tr();
        } else if (!AppRegex.isEgyptianNationalIDValid(data)) {
          return "Invalid national ID".tr();
        }
        return null;
      },
      controller: nationalIDController,
      hitnText: "Enter your national ID",
      textInputType: TextInputType.number,
    );
  }

  BloodTypeDropDownField buildDropDownBloodTypesField() {
    return BloodTypeDropDownField(
      onChanged: (value) {
        setState(() {
          bloodType = value!;
          log(bloodType.toString());
          log(bloodType.toString());
        });
      },
    );
  }

  CustomTextFormField buildPhoneNumberField() {
    return CustomTextFormField(
      validator: (data) {
        if (data == null || data.isEmpty) {
          return "Enter your phone number".tr();
        }
        final regex = RegExp(r'^(010|011|012|015)\d{8}$');
        if (!regex.hasMatch(data)) {
          return "Invalid phone number".tr();
        }
        return null;
      },
      controller: phoneController,
      hitnText: "phone number",
      textInputType: TextInputType.phone,
    );
  }

  CustomTextFormField buildEmailField() {
    return CustomTextFormField(
      validator: (data) {
        if (data == null || data.isEmpty) {
          return "Field is required".tr();
        } else if (!AppRegex.isEmailValid(data)) {
          return "Invalid email".tr();
        }
        return null;
      },
      controller: emailController,
      hitnText: "Email Address",
    );
  }

  CustomTextFormField buildFullNameField() {
    return CustomTextFormField(
      controller: nameController,
      hitnText: "Full Name",
      textInputType: TextInputType.name,
    );
  }

  Future<void> handlingRegister(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (isTermsAccepted) {
        if (passwordController.text == confirmPasswordController.text) {
          await context.read<RegisterCubit>().register(
                name: nameController.text,
                email: emailController.text,
                phoneNumber: phoneController.text,
                NationalId: nationalIDController.text,
                bloodTypeId: bloodType,
                password: passwordController.text,
              );
        } else {
          showSnackBarFuction(context, "Passwords do not match");
          autoValidateMode = AutovalidateMode.always;
          setState(() {});
        }
      } else {
        showSnackBarFuction(
          context,
          "You must accept the terms and conditions".tr(),
        );
      }
    } else {
      autoValidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
