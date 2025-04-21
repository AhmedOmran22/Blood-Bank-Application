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
    required this.bloodType,
    this.fcmTokenm,
    this.bloodTypeid,
    this.gender,
    required this.NationalId,
  });
  factory UserModel.fromFireStore(Map<String, dynamic> json) => UserModel(
        uid: json['uid'] as String,
        email: json['email'] as String,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        bloodType: json['bloodType'] as String,
        fcmTokenm: json['fcmToken'] as String,
        gender: json['gender'] as String,
        NationalId: json['NationalId'] as String,
      );

  toMap() => {
        'uid': uid,
        'email': email,
        'name': name,
        'phoneNumber': phoneNumber,
        'bloodType': bloodType,
        'fcmToken': fcmTokenm,
        'gender': gender,
        'NationalId': NationalId,
      };

  toBackendMap(String password) => {
        "email": email,
        "fullName": name,
        "nationalId": NationalId,
        "phoneNumber": phoneNumber,
        "password": password,
        "bloodTypeId": bloodTypeid
      };
}
