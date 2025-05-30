class UserModel {
  final String? uid;
  final String email;
  final String name;
  final String phoneNumber;
  String? bloodType;
  final String? gender;
  final String NationalId;
  final String? fcmTokenm;
  final int? bloodTypeid;

  UserModel({
    this.uid,
    required this.email,
    required this.name,
    required this.phoneNumber,
   this.bloodType,
    this.fcmTokenm,
    this.bloodTypeid,
    this.gender,
    required this.NationalId,
  });
 
  toBackendMap(String password) => {
        "email": email,
        "fullName": name,
        "nationalId": NationalId,
        "phoneNumber": phoneNumber,
        "password": password,
        "bloodTypeId": bloodTypeid
      };
}
