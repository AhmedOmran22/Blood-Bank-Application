import 'package:blood_bank/features/home/data/models/recommended_result_model.dart';

abstract class RecommendedState {}

class RecommendedInitial extends RecommendedState {}

class RecommendedLoading extends RecommendedState {}

class RecommendedLoaded extends RecommendedState {
  final List<RecommendedModel> recommendations;

  RecommendedLoaded(this.recommendations);
}

class RecommendedError extends RecommendedState {
  final String errMessage;

  RecommendedError(this.errMessage);
}