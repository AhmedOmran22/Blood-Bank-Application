abstract class ForgotAndResetPasswordCubitState {}

class Initial extends ForgotAndResetPasswordCubitState {}

class ForgotPasswordCubitLoading extends ForgotAndResetPasswordCubitState {}

class ForgotPasswordCubitSuccess extends ForgotAndResetPasswordCubitState {}

class ForgotPasswordCubitFailure extends ForgotAndResetPasswordCubitState {
  final String errMessage;

  ForgotPasswordCubitFailure({required this.errMessage});
}

class ResetPasswordCubitLoading extends ForgotAndResetPasswordCubitState {}

class ResetPasswordCubitSuccess extends ForgotAndResetPasswordCubitState {}

class ResetPasswordCubitFailure extends ForgotAndResetPasswordCubitState {
  final String errMessage;

  ResetPasswordCubitFailure({required this.errMessage});
}
