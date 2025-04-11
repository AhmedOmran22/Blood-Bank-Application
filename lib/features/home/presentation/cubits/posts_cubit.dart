import 'package:blood_bank/features/home/data/repos/posts_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/posts_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/post_model.dart';

class PostsCubit extends Cubit<PostsCubitState> {
  PostsCubit(this._postsRepo) : super(PostsCubitInitial());
  final PostsRepo _postsRepo;

  fetchAllPosts() async {
    emit(PostsLodaingState());
    final result = await _postsRepo.getAllPosts();
    result.fold(
      (left) => emit(PostsErrorState(errMessage: left.errMessage)),
      (right) => emit(
        PostsLoadedState(posts: right),
      ),
    );
  }

  addPost(PostModel postModel) async {
    emit(PostsLodaingState());
    final result = await _postsRepo.addPost(postModel);
    result.fold(
      (left) => emit(PostAddedErrorState(errMessage: left.errMessage)),
      (right) => emit(PostAddedSuccessState()),
    );
  }
}
