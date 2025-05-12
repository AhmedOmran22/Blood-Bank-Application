import '../../features/auth/data/models/user_model.dart';
import '../cache/prefs.dart';
import '../constants/constatnts.dart';
UserModel getCurrentUserFromBackEndFunction() {
  UserModel currentUser = UserModel(
    email: Prefs.getString(kUserEmail),
    name: Prefs.getString(kUserName),
    phoneNumber: '',
    NationalId: Prefs.getString(kUserNationalId),
    bloodType: Prefs.getString(kUserBloodType),
  );
  return currentUser;
}
