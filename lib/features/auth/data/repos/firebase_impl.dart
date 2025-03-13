import 'dart:convert';

import 'package:blood_bank/core/services/firestore_service.dart';
import 'package:blood_bank/core/services/push_notification_service.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/cache/prefs.dart';
import '../../../../core/constants/backend_endpoints.dart';
import '../../../../core/constants/constatnts.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../models/user_model.dart';
import 'auth_repo.dart';

class FirebaseImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final FireStoreService fireStoreService;

  FirebaseImpl({
    required this.firebaseAuthService,
    required this.fireStoreService,
  });
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
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(
        uid: user.uid,
        name: userName,
        email: email,
        phoneNumber: phoneNumber,
        bloodType: bloodType,
        fcmTokenm:
            PushNotificationService.fcmToken ?? "fcmToken is not initialized",
        gender: gender,
        NationalId: NationalId,
      );
      await addUserData(user: userModel);
      await saveUserData(user: userModel);
      return Right(userModel);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(FirebaseAuthFailure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signinWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel currentUser = await getUserData(uid: user.uid);
      fireStoreService.updateData(
        path: BackendEndpoints.kUsers,
        docuementId: user.uid,
        data: {"fcmToken": PushNotificationService.fcmToken},
      );
      saveUserData(user: currentUser);
      return Right(currentUser);
    } on CustomException catch (e) {
      return Left(FirebaseAuthFailure(errMessage: e.message));
    }
  }

  @override
  Future addUserData({required UserModel user}) async {
    await fireStoreService.addData(
      path: BackendEndpoints.kUsers,
      data: user.toMap(),
      documentId: user.uid,
    );
  }

  @override
  Future saveUserData({required UserModel user}) async {
    var jsonData = jsonEncode(user.toMap());
    await Prefs.setString(kUserData, jsonData);
  }

  Future<UserModel> getUserData({required String uid}) async {
    var userData = await fireStoreService.getData(
      path: BackendEndpoints.kUsers,
      docuementId: uid,
    );
    return UserModel.fromFireStore(userData);
  }

  @override
  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuthService.signOut();
  }
}
