import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/backend_endpoints.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:blood_bank/core/errors/exception.dart';
import 'package:blood_bank/core/errors/failure.dart';
import 'package:dio/dio.dart';
import 'api_service.dart';

class DioConsumer extends ApiService {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = BackendEndpoints.baseUrl;
    // dio.interceptors.addAll(
    //   [
    //     InterceptorsWrapper(
    //       onRequest: (options, handler) async {
    //         final token = await Prefs.getString(kToken);
    //         if (token != null) {
    //           options.headers['Authorization'] = 'Bearer $token';
    //         }
    //         return handler.next(options);
    //       },
    //     ),
    //     AuthInterceptor(dio),
    //   ],
    // );
  }

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? id,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        message: ServerFailure.fromDioExcepiton(e).errMessage,
      );
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? id,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        message: ServerFailure.fromDioExcepiton(e).errMessage,
      );
    }
  }

  @override
  Future patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? id,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        message: ServerFailure.fromDioExcepiton(e).errMessage,
      );
    }
  }

  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? id,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        message: ServerFailure.fromDioExcepiton(e).errMessage,
      );
    }
  }
}
