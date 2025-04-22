// import 'dart:convert';

import '../../features/auth/data/models/user_model.dart';
import '../cache/prefs.dart';
import '../constants/constatnts.dart';

/// get the data of logged in user !
// UserModel getCurrentUserFromFirebaseFunction() {
//   var jsonString = Prefs.getString(kUserData);
//   var currentUser = UserModel.fromFireStore(jsonDecode(jsonString));
//   return currentUser;
// }

UserModel getCurrentUserFromBackEndFunction() {
  UserModel currentUser = UserModel(
    email: Prefs.getString(kUserEmail),
    name: Prefs.getString(kUserName),
    phoneNumber: 'nope',
    NationalId: Prefs.getString(kUserNationalId),
    bloodType: Prefs.getString(kUserBloodType),
  );
  return currentUser;
}
