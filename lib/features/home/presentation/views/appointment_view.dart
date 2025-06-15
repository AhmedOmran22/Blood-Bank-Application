import 'package:blood_bank/core/services/service_locator.dart';
import 'package:blood_bank/features/home/data/repos/appointment_booking_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/appointment/appointment_cubit.dart';
import 'package:blood_bank/features/home/presentation/views/widgets/appointment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppointmentCubit(appointmentRepo: getIt<AppointmentRepo>()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Book Appointment")),
        body: const AppointmentViewBody(),
      ),
    );
  }
}
