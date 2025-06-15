import 'package:blood_bank/features/home/data/models/recommended_result_model.dart';
import 'package:blood_bank/features/home/data/repos/recommended_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/recommended/recommended_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  final RecommendedRepo recommendedRepo;

  RecommendedCubit({required this.recommendedRepo}) : super(RecommendedInitial());

  Future<void> getRecommendedBloodBanks(RecommendedRequestModel requestModel) async {
    emit(RecommendedLoading());

    try {
      final results = await recommendedRepo.getRecommended(
        governorate: requestModel.governorate,
        bloodType: requestModel.bloodType,
        quantity: requestModel.quantity,
      );
      emit(RecommendedLoaded(results));
    } catch (e) {
      emit(RecommendedError(e.toString()));
    }
  }
}