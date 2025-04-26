import 'package:blood_bank/core/errors/failure.dart';
import 'package:blood_bank/features/home/data/models/mini_post_model.dart';
import 'package:blood_bank/features/home/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class CommunityRepo {
  Future<Either<Failure, List<MiniPostModel>>> fetchAllPosts();

  Future<Either<Failure, void>> publishPost(PostModel postModel);

  Future<Either<Failure, PostModel>> getPostDetailes(String id);
}
