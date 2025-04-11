import 'package:blood_bank/features/home/data/models/post_model.dart';

abstract class PostsCubitState {}

class PostsCubitInitial extends PostsCubitState {}

class PostAddedErrorState extends PostsCubitState {
  final String errMessage;

  PostAddedErrorState({required this.errMessage});
}

class PostAddedSuccessState extends PostsCubitState {}

class PostsLoadedState extends PostsCubitState {
  final List<PostModel> posts;

  PostsLoadedState({required this.posts});
}

class PostsLodaingState extends PostsCubitState {}

class PostsErrorState extends PostsCubitState {
  final String errMessage;

  PostsErrorState({required this.errMessage});
}
