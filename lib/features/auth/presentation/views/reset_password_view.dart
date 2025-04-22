import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:blood_bank/core/services/service_locator.dart';
import 'package:blood_bank/features/auth/data/repos/auth_repo.dart';
import 'package:blood_bank/features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:blood_bank/features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/show_snack_bar_function.dart';
import 'widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotAndResetPasswordCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Reset Password",
            style: Theme.of(context).textTheme.bodyLarge,
          ).tr(),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: const ResetPasswordViewBodyBlocListener(),
      ),
    );
  }
}

class ResetPasswordViewBodyBlocListener extends StatelessWidget {
  const ResetPasswordViewBodyBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotAndResetPasswordCubit,
        ForgotAndResetPasswordCubitState>(
      listener: (context, state) {
        if (state is ResetPasswordCubitSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.login,
            (route) => false,
          );
        }
        if (state is ResetPasswordCubitFailure) {
          showSnackBarFuction(context, state.errMessage);
        }
        if (state is ResetPasswordCubitLoading) {
          showSnackBarFuction(context, "Loading...");
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ResetPasswordViewBody(),
      ),
    );
  }
}
