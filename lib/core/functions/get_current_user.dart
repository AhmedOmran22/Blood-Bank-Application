import 'dart:convert';

import '../../features/auth/data/models/user_model.dart';
import '../cache/prefs.dart';
import '../constants/constatnts.dart';

/// get the data of logged in user !
UserModel getCurrentUser() {
  var jsonString = Prefs.getString(kUserData);
  var currentUser = UserModel.fromJson(jsonDecode(jsonString));
  return currentUser;
}
