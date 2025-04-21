import 'dart:developer';

import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/backend_endpoints.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:blood_bank/core/errors/exception.dart';
import 'package:blood_bank/core/errors/failure.dart';
import 'package:blood_bank/core/services/api_service.dart';
import 'package:blood_bank/features/auth/data/models/user_model.dart';
import 'package:blood_bank/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BackEndAuthImpl extends AuthRepo {
  final ApiService apiService;

  BackEndAuthImpl({required this.apiService});
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
    String? bloodType,
    String? gender,
    required String nationalId,
    int? bloodTypeId,
  }) async {
    try {
      UserModel userModel = UserModel(
        email: email,
        name: userName,
        phoneNumber: phoneNumber,
        NationalId: nationalId,
        bloodTypeid: bloodTypeId,
      );

      await apiService.post(
        BackendEndpoints.register,
        data: userModel.toBackendMap(password),
      );
      return Right(userModel);
    } on CustomException catch (e) {
      log(e.message);
      return Left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
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
    Prefs.removeData(key: kToken);
  }

  @override
  Future<Either<Failure, UserModel>> signinWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var response = await apiService.post(
        BackendEndpoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      Prefs.setString(kToken, response["token"]);
      log(Prefs.getString(kToken));
      return await fetchUserData(token: "");
    } on CustomException catch (e) {
      log(e.message);
      return Left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> confirmEmail({
    required String email,
    required String code,
  }) async {
    try {
      await apiService.post(
        BackendEndpoints.confirmEmail,
        data: {
          'email': email,
          'code': code,
        },
      );
      return const Right(null);
    } on CustomException catch (e) {
      log(e.message);
      return Left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> fetchUserData({required String token}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> resendCode() async {
    try {
      await apiService.post(
        BackendEndpoints.resendConfirmEmail,
        data: {
          'email': Prefs.getString(kUserEmail),
        },
      );
      return const Right(null);
    } on CustomException catch (e) {
      log(e.message);
      return Left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      await apiService.post(
        BackendEndpoints.resendConfirmEmail,
        data: {
          'email': email,
        },
      );
      return const Right(null);
    } on CustomException catch (e) {
      log(e.message);
      return Left(ServerFailure(errMessage: e.message));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
