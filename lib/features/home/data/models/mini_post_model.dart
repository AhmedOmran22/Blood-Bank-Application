class MiniPostModel {
  final int id;
  final String title;
  final String bloodTypeName;
  final String hospitalName;
  final String dateOfPublish;

  MiniPostModel({
    required this.title,
    required this.id,
    required this.bloodTypeName,
    required this.hospitalName,
    required this.dateOfPublish,
  });

  factory MiniPostModel.fromJson(Map<String, dynamic> json) {
    return MiniPostModel(
      title: json['title'],
      id: json['id'],
      bloodTypeName: json['bloodTypeName'],
      hospitalName: json['hospitalName'],
      dateOfPublish: json['dateOfPublish'],
    );
  }
}
