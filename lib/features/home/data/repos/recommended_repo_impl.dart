import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/backend_endpoints.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:blood_bank/core/services/api_service.dart';
import 'package:blood_bank/features/home/data/models/recommended_result_model.dart';
import 'package:blood_bank/features/home/data/repos/recommended_repo.dart';

class RecommendedRepoImpl implements RecommendedRepo {
  final ApiService apiService;

  RecommendedRepoImpl({required this.apiService});

  @override
  Future<List<RecommendedModel>> getRecommended({
    required String governorate,
    required String bloodType,
    required int quantity,
  }) async {
    try {
      final response = await apiService.post(
        BackendEndpoints.recommended,
        data: {
          'governorate': governorate,
          'blood_type': bloodType,
          'quantity': quantity,
        },
        headers: {
          'Authorization': 'Bearer ${Prefs.getString(kToken)}',
        },
      );

      final List data = response['response'];
      return data.map((item) => RecommendedModel.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Error fetching recommendations: $e');
    }
  }
}