class PostModel {
  final String useName;
  final String mobileNumber;
  final int howManyBagsNeeeded;
  final String bloodType;
  final String hospitalName;
  final String whyDoYouNeedBlood;

  PostModel({
    required this.useName,
    required this.mobileNumber,
    required this.howManyBagsNeeeded,
    required this.bloodType,
    required this.hospitalName,
    required this.whyDoYouNeedBlood,
  });
}

List<PostModel> posts = [
  PostModel(
    useName: "Ahmed Ali",
    mobileNumber: "01012345678",
    howManyBagsNeeeded: 2,
    bloodType: "O+",
    hospitalName: "Cairo Hospital",
    whyDoYouNeedBlood: "Emergency surgery",
  ),
  PostModel(
    useName: "Sara Mohamed",
    mobileNumber: "01198765432",
    howManyBagsNeeeded: 3,
    bloodType: "A-",
    hospitalName: "Alexandria Medical Center",
    whyDoYouNeedBlood: "Severe accident",
  ),
  PostModel(
    useName: "Omar Tarek",
    mobileNumber: "01234567890",
    howManyBagsNeeeded: 1,
    bloodType: "B+",
    hospitalName: "Mansoura Hospital",
    whyDoYouNeedBlood: "Cancer treatment",
  ),
  PostModel(
    useName: "Youssef Hassan",
    mobileNumber: "01098765432",
    howManyBagsNeeeded: 4,
    bloodType: "AB-",
    hospitalName: "Assiut University Hospital",
    whyDoYouNeedBlood: "Heart surgery",
  ),
  PostModel(
    useName: "Mariam Adel",
    mobileNumber: "01512345678",
    howManyBagsNeeeded: 2,
    bloodType: "O-",
    hospitalName: "Giza Specialized Hospital",
    whyDoYouNeedBlood: "Complications from childbirth",
  ),
];
