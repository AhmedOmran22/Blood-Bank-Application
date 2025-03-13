import 'package:blood_bank/core/errors/failure.dart';
import 'package:blood_bank/features/auth/data/models/user_model.dart';
import 'package:blood_bank/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BackEndImpl extends AuthRepo {
  @override
  Future addUserData({required UserModel user}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> createUserWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    required String bloodType,
    required String gender,
    required String NationalId,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(User? user) async {
    throw UnimplementedError();
  }

  @override
  Future saveUserData({required UserModel user}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> signinWithEmailAndPassword(
    String email,
    String password,
  ) async {
    throw UnimplementedError();
  }
}
