import 'package:blood_bank/core/services/service_locator.dart';
import 'package:blood_bank/features/auth/data/repos/auth_repo.dart';
import 'package:blood_bank/features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:blood_bank/features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/show_snack_bar_function.dart';
import '../../../../core/routes/app_routes.dart';
import 'widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

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
            "Forget Password",
            style: Theme.of(context).textTheme.bodyLarge,
          ).tr(),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, AppRoutes.login),
          ),
        ),
        body: const ForgotPasswordBlocListner(),
      ),
    );
  }
}

class ForgotPasswordBlocListner extends StatelessWidget {
  const ForgotPasswordBlocListner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotAndResetPasswordCubit,
        ForgotAndResetPasswordCubitState>(
      listener: (context, state) {
        if (state is ForgotPasswordCubitSuccess) {
          Navigator.pushNamed(
            context,
            AppRoutes.resetPassword,
          );
        }
        if (state is ForgotPasswordCubitFailure) {
          showSnackBarFuction(context, state.errMessage);
        }
        if (state is ForgotPasswordCubitLoading) {
          showSnackBarFuction(context, "Loading...");
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ForgetPasswordViewBody(),
      ),
    );
  }
}
