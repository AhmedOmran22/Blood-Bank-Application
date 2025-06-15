abstract class AppointmentRepo {
  Future<void> bookAppointment({
    required String date,
    required String time,
  });
}