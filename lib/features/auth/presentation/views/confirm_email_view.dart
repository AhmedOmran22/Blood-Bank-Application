import 'package:blood_bank/core/services/service_locator.dart';
import 'package:blood_bank/features/auth/data/repos/auth_repo.dart';
import 'package:blood_bank/features/auth/presentation/cubits/confiem_email_cubit/confirm_email_cubit.dart';
import 'package:blood_bank/features/auth/presentation/views/widgets/confirm_email_view_body_bloc_consumer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmEmailView extends StatelessWidget {
  const ConfirmEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmEmailCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Verify Account",
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
        body: const ConfirmEmailViewBodyBlocConsumer(),
      ),
    );
  }
}
