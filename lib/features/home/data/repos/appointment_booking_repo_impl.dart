import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/backend_endpoints.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:blood_bank/core/services/api_service.dart';
import 'package:blood_bank/features/home/data/repos/appointment_booking_repo.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final ApiService apiService;

  AppointmentRepoImpl({required this.apiService});

  @override
  Future<void> bookAppointment({
    required String date,
    required String time,
  }) async {
    try {
      await apiService.post(
        BackendEndpoints.bookAppointment,
        data: {
          "dateOnly": date,
          "timeOnly": time,
          "bloodBankId": 20,
        },
        headers: {
          'Authorization': 'Bearer ${Prefs.getString(kToken)}',
        },
      );
    } catch (e) {
      throw Exception('Failed to book appointment. Please try another time.');
    }
  }
}