import 'package:blood_bank/features/home/data/repos/appointment_booking_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/appointment/appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepo appointmentRepo;

  AppointmentCubit({required this.appointmentRepo}) : super(AppointmentInitial());

  Future<void> bookAppointment({
    required String date,
    required String time,
  }) async {
    emit(AppointmentLoading());
    try {
      await appointmentRepo.bookAppointment(date: date, time: time);
      emit(AppointmentSuccess());
    } catch (e) {
      emit(AppointmentFailure('Please try booking at another time.'));
    }
  }
}