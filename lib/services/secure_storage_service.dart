import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
 

  static final SecureStorageService _instance = SecureStorageService._internal();

  final String _key = "EncryptionKey";
  final String _tokenKey = "TokenKey";
// Create storage
  final FlutterSecureStorage storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));

  
// // Read value
// String value = await storage.read(key: key);

// // Read all values
// Map<String, String> allValues = await storage.readAll();
// // Delete value
// await storage.delete(key: key);

// // Delete all
// await storage.deleteAll();

// // Write value
// await storage.write(key: key, value: value);

  factory SecureStorageService() {
    return _instance;
  }

  SecureStorageService._internal() {
      // init logic
  }

  // MARK: - Crypto Key
  Future<void> saveKey(String value) async {
    return await storage.write(key: _key, value: value);
  }

  Future<String?> getKey() async {
    return await storage.read(key: _key);
  }

  Future<void> removeKey() async {
    return await storage.delete(key: _key);
  }

  Future<void> removeAll() async {
    return await storage.deleteAll();
  }

  // MARK: - Token
  Future<void> saveToken(String value) async {
    return await storage.write(key: _tokenKey, value: value);
  }

  Future<String?> getToken() async {
    return await storage.read(key: _tokenKey);  
  }

  Future<void> removeToken() async {
    return await storage.delete(key: _tokenKey);
  }

}

