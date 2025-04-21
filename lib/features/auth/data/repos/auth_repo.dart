import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failure.dart';
import '../models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> createUserWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    String? bloodType,
    String? gender,
    required String nationalId,
    int? bloodTypeId,
  });
  Future<Either<Failure, UserModel>> fetchUserData({required String token});
  Future<Either<Failure, UserModel>> signinWithEmailAndPassword(
      String email, String password);
  Future addUserData({required UserModel user});
  Future<Either<Failure, void>> confirmEmail(
      {required String email, required String code});
  Future saveUserData({required UserModel user});
  Future<void> deleteUser(User? user);
  Future<Either<Failure, void>> resendCode({required String email});
  Future<void> signOut();
}
