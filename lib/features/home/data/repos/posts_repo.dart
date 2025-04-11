import 'package:blood_bank/core/errors/failure.dart';
import 'package:blood_bank/features/home/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepo 
{
  Future<Either<Failure, List<PostModel>>> getAllPosts();

  Future<Either<Failure, void>> addPost(PostModel postModel);
}