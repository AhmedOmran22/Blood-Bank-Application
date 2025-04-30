import 'package:blood_bank/features/auth/data/repos/auth_repo.dart';
import 'package:blood_bank/features/auth/presentation/cubits/forgot_and_reset_password_cubit/forgot_and_reset_password_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotAndResetPasswordCubit
    extends Cubit<ForgotAndResetPasswordCubitState> {
  ForgotAndResetPasswordCubit(this.authRepo) : super(Initial());

  final AuthRepo authRepo;

  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPasswordCubitLoading());
    final result = await authRepo.forgotPassword(email: email);
    result.fold(
      (failure) =>
          emit(ForgotPasswordCubitFailure(errMessage: failure.errMessage)),
      (nope) => emit(ForgotPasswordCubitSuccess()),
    );
  }

  Future<void> resetPassword({
    required String password,
    required String code,
  }) async {
    emit(ResetPasswordCubitLoading());
    final result = await authRepo.resetPassword(password: password, code: code);
    result.fold(
      (failure) =>
          emit(ResetPasswordCubitFailure(errMessage: failure.errMessage)),
      (nope) => emit(ResetPasswordCubitSuccess()),
    );
  }
}
