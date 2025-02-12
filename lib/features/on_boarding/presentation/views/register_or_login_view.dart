import 'package:blood_bank/features/on_boarding/presentation/views/widgets/register_or_login_view_body.dart';
import 'package:flutter/material.dart';

class RegisterOrLoginView extends StatelessWidget {
  const RegisterOrLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: RegisterOrLoginViewBody(),
      ),
    );
  }
}
