import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/functions/show_snack_bar_function.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../cubits/register_cubit/register_cubit.dart';
import '../../cubits/register_cubit/register_cubit_state.dart';
import 'register_view_body.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterCubitState>(
      listener: (context, state) {
        if (state is RegisterCubitSuccess) {
          Navigator.pushNamed(
            context,
            AppRoutes.confirmEmail,
          );
          showSnackBarFuction(context, "Register Successfully");
        }
        if (state is RegisterCubitError) {
          showSnackBarFuction(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterCubitLoading,
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          child: const RegisterViewBody(),
        );
      },
    );
  }
}
