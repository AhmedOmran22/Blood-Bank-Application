import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> registerNewUser({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    String? bloodType,
    String? gender,
    required String nationalId,
    int? cityId,
    int? bloodTypeId,
  });
  Future<Either<Failure, UserModel>> fetchUserData({required String token});
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  );
  Future<Either<Failure, void>> confirmEmail({
    required String email,
    required String code,
  });
  Future<Either<Failure, void>> resendCode();
  Future<Either<Failure, void>> forgotPassword({required String email});
  Future<Either<Failure, void>> resetPassword({
    required String password,
    required String code,
  });
}
