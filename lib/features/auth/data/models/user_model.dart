class UserModel {
  final String uid;
  final String email;
  final String name;
  final String phoneNumber;
  final String bloodType;
  final String gender;
  String fcmTokenm;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.bloodType,
    required this.fcmTokenm,
    required this.gender,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'] as String,
        email: json['email'] as String,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        bloodType: json['bloodType'] as String,
        fcmTokenm: json['fcmToken'] as String,
        gender: json['gender'] as String,
      );

  toMap() => {
        'uid': uid,
        'email': email,
        'name': name,
        'phoneNumber': phoneNumber,
        'bloodType': bloodType,
        'fcmToken': fcmTokenm,
        'gender': gender,
      };
}
