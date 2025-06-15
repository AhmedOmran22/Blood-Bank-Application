class AppointmentRequestModel {
  final String dateOnly;
  final String timeOnly;
  final int bloodBankId;

  AppointmentRequestModel({
    required this.dateOnly,
    required this.timeOnly,
    this.bloodBankId = 20,
  });

  Map<String, dynamic> toJson() {
    return {'dateOnly': dateOnly, 'timeOnly': timeOnly, 'bloodBankId': 30};
  }
}
