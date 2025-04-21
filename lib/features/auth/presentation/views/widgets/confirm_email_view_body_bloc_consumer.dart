import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:blood_bank/core/functions/show_snack_bar_function.dart';
import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:blood_bank/features/auth/presentation/cubits/confiem_email_cubit/confirm_email_cubit.dart';
import 'package:blood_bank/features/auth/presentation/cubits/confiem_email_cubit/confirm_email_cubit_state.dart';
import 'package:blood_bank/features/auth/presentation/views/widgets/confirm_email_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ConfirmEmailViewBodyBlocConsumer extends StatelessWidget {
  const ConfirmEmailViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmEmailCubit, ConfirmEmailCubitState>(
      listener: (context, state) {
        if (state is ConfirmEmailCubitSuccess) {
          Prefs.removeData(key: kUserEmail);
          showSnackBarFuction(context, "Email Confirmed Successfully");
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
        if (state is ConfirmEmailCubitFailure) {
          showSnackBarFuction(context, state.errorMessage);
        }
        if (state is ResendEmailCubitSuccess) {
          showSnackBarFuction(context, "Code Resend Successfully");
        }
        if (state is ResendPasswordCubitFailure) {
          showSnackBarFuction(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ConfirmEmailCubitLoading,
          child: const confirmEmailViewBody(),
        );
      },
    );
  }
}
