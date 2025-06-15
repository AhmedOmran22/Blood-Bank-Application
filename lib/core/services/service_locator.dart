import 'package:blood_bank/core/services/api_service.dart';
import 'package:blood_bank/core/services/dio_consumer.dart';
import 'package:blood_bank/features/auth/data/repos/auth_repo_impl.dart';
import 'package:blood_bank/features/home/data/repos/appointment_booking_repo.dart';
import 'package:blood_bank/features/home/data/repos/appointment_booking_repo_impl.dart';
import 'package:blood_bank/features/home/data/repos/community_repo.dart';
import 'package:blood_bank/features/home/data/repos/community_repo_impl.dart';
import 'package:blood_bank/features/home/data/repos/predict_repo.dart';
import 'package:blood_bank/features/home/data/repos/predict_repo_impl.dart';
import 'package:blood_bank/features/home/data/repos/recommended_repo.dart';
import 'package:blood_bank/features/home/data/repos/recommended_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repos/auth_repo.dart';

final getIt = GetIt.instance;
void setupGetit() {
   getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(DioConsumer(dio: getIt<Dio>()));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<CommunityRepo>(
    CommunityRepoImpl(
      apiService: getIt<ApiService>(),
    ),
  );
  getIt.registerSingleton<PredictRepo>(
    PredictRepoImpl(getIt<ApiService>()),
  );
  getIt.registerSingleton<RecommendedRepo>(
    RecommendedRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<AppointmentRepo>(
    AppointmentRepoImpl(apiService: getIt<ApiService>()),
  );
}
