import 'package:blood_bank/features/auth/data/repos/auth_repo.dart';
import 'package:blood_bank/features/auth/presentation/cubits/confiem_email_cubit/confirm_email_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmEmailCubit extends Cubit<ConfirmEmailCubitState> {
  ConfirmEmailCubit(this.authRepo) : super(ConfirmEmailCubitInitial());
  final AuthRepo authRepo;

  Future<void> confirmEmail(
      {required String email, required String otp}) async {
    emit(ConfirmEmailCubitLoading());
    final result = await authRepo.confirmEmail(email: email, otp: otp);
    result.fold(
      (failure) => emit(ConfirmEmailCubitFailure(failure.errMessage)),
      (user) => emit(ConfirmEmailCubitSuccess()),
    );
  }
}
