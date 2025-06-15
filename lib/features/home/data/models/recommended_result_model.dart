class RecommendedModel {
  final String bloodBankName;
  final String bloodType;
  final String governorate;

  RecommendedModel({
    required this.bloodBankName,
    required this.bloodType,
    required this.governorate,
  });

  factory RecommendedModel.fromJson(Map<String, dynamic> json) {
    return RecommendedModel(
      bloodBankName: json['BloodBank_Name'],
      bloodType: json['Blood_Type'],
      governorate: json['governorate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'BloodBank_Name': bloodBankName,
      'Blood_Type': bloodType,
      'governorate': governorate,
    };
  }
}

class RecommendedRequestModel {
  final String governorate;
  final String bloodType;
  final int quantity;

  RecommendedRequestModel({
    required this.governorate,
    required this.bloodType,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'governorate': governorate,
      'blood_type': bloodType,
      'quantity': quantity,
    };
  }

  factory RecommendedRequestModel.fromJson(Map<String, dynamic> json) {
    return RecommendedRequestModel(
      governorate: json['governorate'],
      bloodType: json['blood_type'],
      quantity: json['quantity'],
    );
  }
}