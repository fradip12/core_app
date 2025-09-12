import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage(this.storage);
  final FlutterSecureStorage storage;

  static const String _idToken = 'app-id-token';

  Future<void> setIdToken(String value) {
    return storage.write(key: _idToken, value: value);
  }

  Future<String?> get idToken => storage.read(key: _idToken);

  Future<void> clear() async {
    await storage.delete(key: _idToken);
  }
}
