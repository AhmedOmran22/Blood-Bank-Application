import 'package:blood_bank/features/home/data/models/recommended_result_model.dart';

abstract class RecommendedRepo {
  Future<List<RecommendedModel>> getRecommended({
    required String governorate,
    required String bloodType,
    required int quantity,
  });
}