

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<ConfirmEmailCubit, ConfirmEmailCubitState>(
        listener: (context, state) {
          if (state is ConfirmEmailCubitSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }
          if (state is ConfirmEmailCubitFailure) {
            showSnackBarFuction(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return const ModalProgressHUD(
            inAsyncCall: false,
            child: confirmEmailViewBody(),
          );
        },
      ),
    );
  }
}
