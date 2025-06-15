class PredictResultModel {
  final String disease;
  final double? prevalence;
  final String? donationStatus;

  PredictResultModel({
    required this.disease,
    required this.prevalence,
    required this.donationStatus,
  });

  factory PredictResultModel.fromJson(Map<String, dynamic> json) {
    return PredictResultModel(
      disease: json['disease'],
      prevalence: json['prevalence'] != null
          ? (json['prevalence'] as num).toDouble()
          : null,
      donationStatus: json['donationStatus'],
    );
  }
}

class PredictRequestModel {
  final List<double> inputs;

  PredictRequestModel({required this.inputs});

  Map<String, dynamic> toJson() {
    return {
      "Diseases": [
        {"Disease": "Hepatitis B", "Prevalence": inputs[0]},
        {"Disease": "Thalassemia", "Prevalence": inputs[1]},
        {"Disease": "Celiac Disease", "Prevalence": inputs[2]},
        {"Disease": "Rheumatoid Arthritis", "Prevalence": inputs[3]},
        {"Disease": "Thalassemia", "Prevalence": inputs[4]},
        {"Disease": "Type 1 Diabetes", "Prevalence": inputs[0]},
        {"Disease": "Rheumatoid Arthritis", "Prevalence": inputs[1]},
        {"Disease": "Multiple Sclerosis", "Prevalence": inputs[2]},
        {"Disease": "HIV", "Prevalence": inputs[2]},
        {"Disease": "Cancer", "Prevalence": inputs[3]},
      ]
    };
  }
}
