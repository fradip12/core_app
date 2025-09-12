import 'package:dio/dio.dart';

import '../config/app_di.dart';
import '../utils/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(options, handler) async {
    final token = await locator<SecureStorage>().idToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(err, handler) {
    if (err.response != null) {
      final response = err.response!;
      if (response.data != null) {
        // final data = response.data!;
        handler.next(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            // error: ApiException(
            //   data['message'] ?? 'Unknown error',
            //   data['code'] ?? 500,
            // ),
          ),
        );

        return;
      }
    }

    handler.next(err);
  }
}
