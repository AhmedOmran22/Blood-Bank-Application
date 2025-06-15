import 'package:blood_bank/features/home/data/models/predict_result_model.dart';
import 'package:blood_bank/features/home/data/repos/predict_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/predict_cubit/predict_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PredictCubit extends Cubit<PredictState> {
  PredictCubit(this.predictRepo) : super(PredictInitial());

  final PredictRepo predictRepo;

  Future<void> predict(PredictRequestModel model) async {
    emit(PredictLoading());
    final result = await predictRepo.predictDonationEligibility(model.toJson());
    result.fold(
      (failure) => emit(PredictError(failure.errMessage)),
      (results) => emit(PredictLoaded(results)),
      
    );
  }
}