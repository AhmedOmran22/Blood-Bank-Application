import 'package:blood_bank/core/cache/prefs.dart';
import 'package:blood_bank/core/constants/constatnts.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  AuthInterceptor(this.dio);
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = Prefs.getString(kToken);
        final response =
            await dio.post('https://api.example.com/refresh-token', data: {
          'refresh_token': refreshToken,
        });

        final newAccessToken = response.data['access_token'];
        await Prefs.setString(kToken, newAccessToken);

        final requestOptions = err.requestOptions;
        requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

        final retryResponse = await dio.fetch(requestOptions);
        return handler.resolve(retryResponse);
      } catch (e) {
        return handler.reject(err);
      }
    }
    return handler.next(err);
  }
}
