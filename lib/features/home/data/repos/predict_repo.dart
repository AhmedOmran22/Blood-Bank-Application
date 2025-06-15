import 'package:blood_bank/core/errors/failure.dart';
import 'package:blood_bank/features/home/data/models/predict_result_model.dart';
import 'package:dartz/dartz.dart';

abstract class PredictRepo {
  Future<Either<Failure, List<PredictResultModel>>> predictDonationEligibility(Map<String, dynamic> data);
}