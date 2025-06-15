import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/backend_endpoints.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:blood_bank/core/errors/failure.dart';
import 'package:blood_bank/core/services/api_service.dart';
import 'package:blood_bank/features/home/data/models/predict_result_model.dart';
import 'package:blood_bank/features/home/data/repos/predict_repo.dart';
import 'package:dartz/dartz.dart';

class PredictRepoImpl extends PredictRepo {
  final ApiService apiService;

  PredictRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<PredictResultModel>>> predictDonationEligibility(
      Map<String, dynamic> data) async {
    try {
      final response =
          await apiService.post(BackendEndpoints.predictDonation, data: data, headers: {
          'Authorization': 'Bearer ${Prefs.getString(kToken)}',
        },);
      final List results = response['results'];
      final list = results.map((e) => PredictResultModel.fromJson(e)).toList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
