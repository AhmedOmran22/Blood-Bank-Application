import 'package:get_it/get_it.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/data/repos/firebase_impl.dart';
import 'firebase_auth_service.dart';
import 'firestore_service.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<FireStoreService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(
    FirebaseImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      fireStoreService: getIt<FireStoreService>(),
    ),
  );
}
