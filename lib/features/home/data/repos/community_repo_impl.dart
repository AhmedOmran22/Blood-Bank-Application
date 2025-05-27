import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/backend_endpoints.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:blood_bank/core/errors/failure.dart';
import 'package:blood_bank/core/services/api_service.dart';
import 'package:blood_bank/features/home/data/models/mini_post_model.dart';
import 'package:blood_bank/features/home/data/models/post_model.dart';
import 'package:blood_bank/features/home/data/repos/community_repo.dart';
import 'package:dartz/dartz.dart';

class CommunityRepoImpl implements CommunityRepo {
  final ApiService apiService;

  CommunityRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<MiniPostModel>>> fetchAllPosts() async {
    List<MiniPostModel> miniPosts = [];
    try {
      final response = await apiService.get(
        BackendEndpoints.getAllPosts,
        headers: {
          'Authorization': 'Bearer ${Prefs.getString(kToken)}',
        },
      );
      for (var post in response) {
        miniPosts.add(MiniPostModel.fromJson(post));
      }
      return Right(miniPosts.reversed.toList());
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PostModel>> getPostDetailes(String id) async {
    try {
      final response = await apiService.get(
        BackendEndpoints.getAllPosts +
            '/' +
            id +
            BackendEndpoints.getPostDetailes,
        headers: {
          'Authorization': 'Bearer ${Prefs.getString(kToken)}',
        },
      );
      return Right(PostModel.fromJson(response));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> publishPost(PostModel postModel) async {
    try {
      await apiService.post(
        BackendEndpoints.publishPost,
        headers: {
          'Authorization': 'Bearer ${Prefs.getString(kToken)}',
        },
        data: postModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
