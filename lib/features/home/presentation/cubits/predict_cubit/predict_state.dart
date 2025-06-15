import 'package:blood_bank/features/home/data/models/predict_result_model.dart';

abstract class PredictState {}

class PredictInitial extends PredictState {}

class PredictLoading extends PredictState {}

class PredictLoaded extends PredictState {
  final List<PredictResultModel> results;

  PredictLoaded(this.results);
}

class PredictError extends PredictState {
  final String message;

  PredictError(this.message);
}