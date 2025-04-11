import 'package:blood_bank/core/services/api_service.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/data/repos/firebase_impl.dart';
import 'firebase_auth_service.dart';
import 'firestore_service.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<ApiService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(
    FirebaseImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      apiService: getIt<ApiService>(),
    ),
  );
}
