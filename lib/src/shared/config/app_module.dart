import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/api_client.dart';
import '../utils/secure_storage.dart';

@module
abstract class AppModules {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  @Named('apiClient')
  Dio get dio => ApiClient.instance;

  @lazySingleton
  FlutterSecureStorage get storage {
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  @lazySingleton
  SecureStorage get dataStorage => SecureStorage(storage);

  @preResolve
  @lazySingleton
  @Named('baseUrl')
  Future<String> get baseUrl =>
      Future<String>.value('https://68c3d67e81ff90c8e61a40eb.mockapi.io/v1/');
}
