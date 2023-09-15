import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final SecureStorageService _instance = SecureStorageService._internal();

  final String key = "EncryptionKey";
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

  Future<void> saveKey(String value) async {
    return await storage.write(key: key, value: value);
  }

  Future<String?> getKey() async {
    return await storage.read(key: key);
  }

  Future<void> removeKey() async {
    return await storage.delete(key: key);
  }

  Future<void> removeAll() async {
    return await storage.deleteAll();
  }

}

