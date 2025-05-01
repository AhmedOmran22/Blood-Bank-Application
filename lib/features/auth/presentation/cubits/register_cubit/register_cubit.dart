import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/auth_repo.dart';
import 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit(this.authRepo) : super(RegisterCubitInitial());
  final AuthRepo authRepo;

  Future<void> registerNewUser({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String NationalId,
    int? bloodTypeId,
    String? bloodType,
    String? gender,
  }) async {
    // send loading state
    emit(RegisterCubitLoading());
    final result = await authRepo.registerNewUser(
      email: email,
      password: password,
      userName: name,
      phoneNumber: phoneNumber,
      bloodType: bloodType,
      gender: gender,
      nationalId: NationalId,
      bloodTypeId: bloodTypeId,
    );
    result.fold(
      (failure) => emit(RegisterCubitError(failure.errMessage)),
      (user) => emit(RegisterCubitSuccess(userModel: user)),
    );
  }
}
