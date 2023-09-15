// import 'dart:convert';
import 'dart:isolate';

// import 'package:crypto/crypto.dart';

class CryptoService {

  static final CryptoService _instance = CryptoService._internal();

  factory CryptoService() {
    return _instance;
  }

  CryptoService._internal() {
      // init logic
  }

  Future<String> encode(String string) async {
    // var bytes = utf8.encode(string);  
    // var digest = md5.convert(bytes);
    // return digest.toString();
    var some = await Isolate.run(() { return ""; });
    return some;
  }

  Future<String> decode(String string) async {
    // return "";
    // var bytes = utf8.encode(string); 
    // var digest = md5.convert(input);
    // return digest.toString()
    return await Isolate.run(() {return "";});
  }

  

  
}