import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage(this.storage);
  final FlutterSecureStorage storage;

  static const String _idToken = 'pc-id-token';
  static const String _idUser = 'pc-id-user';
  static const String _idResidential = 'pc-id-residential';
  static const String _userNickname = 'pc-user-nickname';
  static const String _isRegistrationCompleted = 'pc-is-registration-completed';
  static const String _referralCode = 'pc-referral-code';

  Future<void> setIdToken(String value) {
    return storage.write(key: _idToken, value: value);
  }

  Future<String?> get idToken => storage.read(key: _idToken);

  Future<void> setIdUser(String value) {
    return storage.write(key: _idUser, value: value);
  }

  Future<String?> get idUser => storage.read(key: _idUser);

  Future<void> setIdResidential(String value) {
    return storage.write(key: _idResidential, value: value);
  }

  Future<String?> get idResidential => storage.read(key: _idResidential);

  Future<void> setNickname(String value) {
    return storage.write(key: _userNickname, value: value);
  }

  Future<String?> get userNickname => storage.read(key: _userNickname);

  Future<void> setIsRegistrationCompleted(bool value) {
    return storage.write(
      key: _isRegistrationCompleted,
      value: value.toString(),
    );
  }

  Future<bool> get isRegistrationCompleted async {
    final value = await storage.read(key: _isRegistrationCompleted);
    if (value == null) return false;

    return bool.tryParse(value) ?? false;
  }

  Future<void> setReferralCode(String value) {
    return storage.write(key: _referralCode, value: value);
  }

  Future<String?> get referralCode => storage.read(key: _referralCode);

  Future<void> storeUserData({
    required String idToken,
    required String idUser,
    required String idResidential,
    required String userNickname,
    required bool isRegistrationCompleted,
    required String referralCode,
  }) async {
    await setIdToken(idToken);
    await setIdUser(idUser);
    await setIdResidential(idResidential);
    await setNickname(userNickname);
    await setIsRegistrationCompleted(isRegistrationCompleted);
    await setReferralCode(referralCode);
  }

  Future<void> clear() async {
    await storage.delete(key: _idToken);
    await storage.delete(key: _idUser);
    await storage.delete(key: _idResidential);
    await storage.delete(key: _userNickname);
    await storage.delete(key: _isRegistrationCompleted);
    await storage.delete(key: _referralCode);
  }
}
