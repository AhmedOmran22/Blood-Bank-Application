import 'package:blood_bank/features/home/data/models/mini_post_model.dart';

abstract class CommunityCubitState {}

class CommunityCubitInitial extends CommunityCubitState {}

class ErrorState extends CommunityCubitState {
  final String errMessage;
  ErrorState({required this.errMessage});
}

class LoadingState extends CommunityCubitState {}

class MiniPostsLoadedState extends CommunityCubitState {
  final List<MiniPostModel> miniPosts;

  MiniPostsLoadedState({required this.miniPosts});
}

class PostAddedSuccessState extends CommunityCubitState {}
