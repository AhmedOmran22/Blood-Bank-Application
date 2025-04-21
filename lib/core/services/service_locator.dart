import 'package:blood_bank/core/services/api_service.dart';
import 'package:blood_bank/core/services/dio_consumer.dart';
import 'package:blood_bank/features/auth/data/repos/back_end_auth_impl.dart';
import 'package:blood_bank/features/home/data/repos/posts_repo.dart';
import 'package:blood_bank/features/home/data/repos/posts_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repos/auth_repo.dart';
// import '../../features/auth/data/repos/firebase_impl.dart';
import 'firebase_auth_service.dart';
// import 'firestore_service.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(DioConsumer(dio: getIt<Dio>()));
  getIt.registerSingleton<AuthRepo>(
    BackEndAuthImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerSingleton<PostsRepo>(
    PostsRepoImpl(
      apiService: getIt<ApiService>(),
    ),
  );
}
