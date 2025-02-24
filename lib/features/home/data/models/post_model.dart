class PostModel {
  final String useName;
  final String mobileNumber;
  final String title;
  final int howManyBagsNeeeded;
  final String bloodType;
  final String hospitalName;
  final String whyDoYouNeedBlood;
  final String dateOfPost;

  PostModel({
    required this.title,
    required this.useName,
    required this.dateOfPost,
    required this.mobileNumber,
    required this.howManyBagsNeeeded,
    required this.bloodType,
    required this.hospitalName,
    required this.whyDoYouNeedBlood,
  });
}
List<PostModel> posts = [
  PostModel(
    title: "Urgent Need for Blood",
    useName: "Ahmed Ali",
    dateOfPost: "2025-02-24",
    mobileNumber: "01012345678",
    howManyBagsNeeeded: 2,
    bloodType: "O+",
    hospitalName: "Cairo Hospital",
    whyDoYouNeedBlood: "Emergency surgery after a car accident.",
  ),
  PostModel(
    title: "Help Save a Life",
    useName: "Sara Mohamed",
    dateOfPost: "2025-02-23",
    mobileNumber: "01198765432",
    howManyBagsNeeeded: 3,
    bloodType: "A-",
    hospitalName: "Alexandria Medical Center",
    whyDoYouNeedBlood: "Severe internal bleeding, urgent transfusion needed.",
  ),
  PostModel(
    title: "Cancer Patient Needs Blood",
    useName: "Omar Tarek",
    dateOfPost: "2025-02-22",
    mobileNumber: "01234567890",
    howManyBagsNeeeded: 1,
    bloodType: "B+",
    hospitalName: "Mansoura Hospital",
    whyDoYouNeedBlood: "Ongoing chemotherapy treatment.",
  ),
  PostModel(
    title: "Heart Surgery Patient Needs Blood",
    useName: "Youssef Hassan",
    dateOfPost: "2025-02-21",
    mobileNumber: "01098765432",
    howManyBagsNeeeded: 4,
    bloodType: "AB-",
    hospitalName: "Assiut University Hospital",
    whyDoYouNeedBlood: "Preparing for major heart surgery.",
  ),
  PostModel(
    title: "Mother in Critical Condition Needs Blood",
    useName: "Mariam Adel",
    dateOfPost: "2025-02-20",
    mobileNumber: "01512345678",
    howManyBagsNeeeded: 2,
    bloodType: "O-",
    hospitalName: "Giza Specialized Hospital",
    whyDoYouNeedBlood: "Complications from childbirth, urgent transfusion required.",
  ),
];
