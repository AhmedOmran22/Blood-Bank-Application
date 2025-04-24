import 'package:blood_bank/features/home/data/repos/posts_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/posts_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/post_model.dart';

class PostsCubit extends Cubit<PostsCubitState> {
  PostsCubit(this._postsRepo) : super(PostsCubitInitial());
  final PostsRepo _postsRepo;

  fetchAllPosts() async {
    emit(LoadingState());
    final result = await _postsRepo.fetchAllPosts();
    result.fold(
      (failure) => emit(ErrorState(errMessage: failure.errMessage)),
      (MiniPosts) => emit(MiniPostsLoadedState(miniPosts: MiniPosts)),
    );
  }

  addPost(PostModel postModel) async {
    emit(LoadingState());
    final result = await _postsRepo.publishPost(postModel);
    result.fold(
      (failure) => emit(ErrorState(errMessage: failure.errMessage)),
      (_) => emit(PostAddedSuccessState()),
    );
  }

  getPostDetails(String id) async {
    emit(LoadingState());
    final result = await _postsRepo.getPostDetailes(id);
    result.fold(
      (failure) => emit(ErrorState(errMessage: failure.errMessage)),
      (post) => emit(PostDetailsLoadedState(postModel: post)),
    );
  }
}
