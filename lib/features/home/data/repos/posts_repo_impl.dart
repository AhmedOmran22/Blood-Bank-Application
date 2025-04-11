import 'package:blood_bank/core/constants/backend_endpoints.dart';
import 'package:blood_bank/core/errors/failure.dart';
import 'package:blood_bank/core/services/api_service.dart';
import 'package:blood_bank/features/home/data/models/post_model.dart';
import 'package:blood_bank/features/home/data/repos/posts_repo.dart';
import 'package:dartz/dartz.dart';

class PostsRepoImpl implements PostsRepo {
  final ApiService apiService;

  PostsRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, void>> addPost(PostModel postModel) async {
    try {
      await apiService.post(
        BackendEndpoints.kPosts,
        data: postModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getAllPosts() async {
    try {
      List<PostModel> posts = [];
      var data = await apiService.get(BackendEndpoints.kPosts) as List;
      for (var post in data) {
        posts.add(PostModel.fromJson(post));
      }
      return Right(posts);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
