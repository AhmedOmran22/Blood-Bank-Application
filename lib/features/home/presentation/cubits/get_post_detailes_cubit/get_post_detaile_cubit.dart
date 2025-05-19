import 'package:blood_bank/features/home/data/repos/community_repo.dart';
import 'package:blood_bank/features/home/presentation/cubits/get_post_detailes_cubit/get_post_detailes_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPostDetailesCubit extends Cubit<GetPostDetailesCubitState> {
  GetPostDetailesCubit(this._postsRepo) : super(GetPostDetailesCubitInitial());

  final CommunityRepo _postsRepo;

  getPostDetails(String id) async {
    emit(GetPostDetailesCubitLoading());
    final result = await _postsRepo.getPostDetailes(id);
    result.fold(
      (failure) =>
          emit(GetPostDetailesCubitError(errMessage: failure.errMessage)),
      (post) => emit(GetPostDetailesCubitLoaded(postModel: post)),
    );
  }
}
