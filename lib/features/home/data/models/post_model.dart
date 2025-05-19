class PostModel {
  final String userName;
  final String mobileNumber;
  final String title;
  final int howManyBagsNeeeded;
  final String? bloodType;
  final String hospitalName;
  final String whyDoYouNeedBlood;
  final String dateYouNeedBlod;
  final String cityName;
  final int? bloodTypeid;
  final int? id;
  PostModel({
    this.id,
    required this.cityName,
    required this.title,
    required this.userName,
    required this.dateYouNeedBlod,
    required this.mobileNumber,
    required this.howManyBagsNeeeded,
    this.bloodType,
    this.bloodTypeid,
    required this.hospitalName,
    required this.whyDoYouNeedBlood,
  });
  toJson() {
    return {
      "contactPerson": userName,
      "title": title,
      "hospitalName": hospitalName,
      "bagsNeeded": howManyBagsNeeeded,
      "cityName": cityName,
      "description": whyDoYouNeedBlood,
      "mobileNumber": mobileNumber,
      "dateOfPublish": dateYouNeedBlod,
      "bloodTypeId": bloodTypeid,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        userName: json["contactPerson"],
        title: json["title"],
        hospitalName: json["hospitalName"],
        howManyBagsNeeeded: json["bagsNeeded"],
        cityName: json["cityName"],
        whyDoYouNeedBlood: json["description"],
        mobileNumber: json["mobileNumber"] ?? "01229804760",
        dateYouNeedBlod: json["dateOfPublish"],
        bloodType: json["bloodTypeName"],
      );
}
