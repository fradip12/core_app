import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import '../models/result.dart';
import '../network/api_failure.dart';

class Callbacks {
  static Future<Result<T>> executeWithTryCatch<T>({
    required Future<T> Function() operation,
  }) async {
    try {
      final result = await operation();
      return Result.ok(result);
    } on DioException catch (e) {
      final failure = handleFailure(e);

      final exception = Exception(failure.message);

      Logger('DioException').warning(exception);
      return Result.error(
        exception,
      );
    } on PlatformException catch (e) {
      debugPrint(e.toString());

      Logger('PlatformException').warning(e.toString());
      return Result.error(Exception(e.toString()));
    } on Exception catch (e) {
      debugPrint(e.toString());

      Logger('Exception').warning(e.toString());
      return Result.error(e);
    }
  }
}
