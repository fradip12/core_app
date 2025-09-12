import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import '../models/base_results.dart';

class Callbacks {
  static Future<Result<T>> executeWithTryCatch<T>({
    required Future<T> Function() operation,
  }) async {
    try {
      final result = await operation();
      return Result.ok(result);
    } on DioException catch (e) {
      Logger('DioException').warning(e.toString());
      return Result.error(
        Exception('DioException: ${e.toString()}'),
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
