import 'package:blood_bank/features/home/data/models/post_model.dart';

abstract class GetPostDetailesCubitState {}

class GetPostDetailesCubitInitial extends GetPostDetailesCubitState {}

class GetPostDetailesCubitLoading extends GetPostDetailesCubitState {}

class GetPostDetailesCubitLoaded extends GetPostDetailesCubitState {
  final PostModel postModel;

  GetPostDetailesCubitLoaded({required this.postModel});
}

class GetPostDetailesCubitError extends GetPostDetailesCubitState 
{
  final String errMessage;

  GetPostDetailesCubitError({required this.errMessage});
}