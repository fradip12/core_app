import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_interceptor.dart';

class ApiClient {
  static Dio get instance {
    // Create Dio instance
    final Dio dio = Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
      ),
    );

    dio.interceptors.addAll(<Interceptor>[
      AuthInterceptor(),
      ErrorInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        error: true,
        responseBody: true,
      ),
    ]);

    return dio;
  }
}
