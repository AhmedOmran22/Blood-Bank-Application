import 'package:blood_bank/features/home/data/repos/community_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/community_cubit/community_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/post_model.dart';

class CommunityCubit extends Cubit<CommunityCubitState> {
  CommunityCubit(this._postsRepo) : super(CommunityCubitInitial());
  final CommunityRepo _postsRepo;

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
}
