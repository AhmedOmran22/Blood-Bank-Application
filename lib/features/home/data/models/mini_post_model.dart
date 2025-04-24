class MiniPostModel {
  final int id;
  final String bloodTypeName;
  final String hospitalName;
  final String dateOfPublish;

  MiniPostModel({
    required this.id,
    required this.bloodTypeName,
    required this.hospitalName,
    required this.dateOfPublish,
  });

  factory MiniPostModel.fromJson(Map<String, dynamic> json) {
    return MiniPostModel(
      id: json['id'],
      bloodTypeName: json['bloodTypeName'],
      hospitalName: json['HospitalName'],
      dateOfPublish: json['dateOfPublish'],
    );
  }
}
