import 'package:blood_bank/features/home/data/models/mini_post_model.dart';
import 'package:blood_bank/features/home/data/models/post_model.dart';

abstract class PostsCubitState {}

class PostsCubitInitial extends PostsCubitState {}

class ErrorState extends PostsCubitState {
  final String errMessage;
  ErrorState({required this.errMessage});
}

class LoadingState extends PostsCubitState {}

class MiniPostsLoadedState extends PostsCubitState {
  final List<MiniPostModel> miniPosts;

  MiniPostsLoadedState({required this.miniPosts});
}

class PostDetailsLoadedState extends PostsCubitState {
  final PostModel postModel;

  PostDetailsLoadedState({required this.postModel});
}

class PostAddedSuccessState extends PostsCubitState {}
