import 'package:blood_bank/core/functions/show_snack_bar_function.dart';
import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:blood_bank/features/auth/presentation/cubits/forgot_and_reset_password_cubit/forgot_and_reset_password_cubit.dart';
import 'package:blood_bank/features/auth/presentation/cubits/forgot_and_reset_password_cubit/forgot_and_reset_password_cubit_state.dart';
import 'package:blood_bank/features/auth/presentation/views/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgotPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ForgotPasswordViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotAndResetPasswordCubit,
        ForgotAndResetPasswordCubitState>(listener: (context, state) {
      if (state is ForgotPasswordCubitSuccess) {
        Navigator.pushNamed(
          context,
          AppRoutes.resetPassword,
        );
      }
      if (state is ForgotPasswordCubitFailure) {
        showSnackBarFuction(context, state.errMessage);
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is ForgotPasswordCubitLoading,
        child: const ForgetPasswordViewBody(),
      );
    });
  }
}
