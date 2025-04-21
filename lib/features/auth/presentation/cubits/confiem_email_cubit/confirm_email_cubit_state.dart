abstract class ConfirmEmailCubitState {}

class ConfirmEmailCubitInitial extends ConfirmEmailCubitState {}

class ConfirmEmailCubitLoading extends ConfirmEmailCubitState {}

class ConfirmEmailCubitSuccess extends ConfirmEmailCubitState {}

class ConfirmEmailCubitFailure extends ConfirmEmailCubitState 
{
  final String errorMessage;
  ConfirmEmailCubitFailure(this.errorMessage);
}