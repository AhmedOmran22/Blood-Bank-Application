import 'dart:convert';

import '../../features/auth/data/models/user_model.dart';
import '../cache/prefs.dart';
import '../constants/constatnts.dart';

/// get the data of logged in user !
UserModel getCurrentUserFunction() {
  var jsonString = Prefs.getString(kUserData);
  var currentUser = UserModel.fromFireStore(jsonDecode(jsonString));
  return currentUser;
}
