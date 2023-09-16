import 'dart:convert';
import 'dart:async';
import 'dart:isolate';
import 'package:ekzh/services/entities/auth_entities.dart';
import 'package:http/http.dart';

class HttpsService {
  
  static final HttpsService _instance = HttpsService._internal();

  factory HttpsService() {
    return _instance;
  }

  HttpsService._internal() {
      // init logic
  }

  String baseUrl = "mocard.ru";
  String api = "/api";
  final client = Client();

  Future<String> auth({required String email, required String pass}) async {
    Map request = {
      "email": email,
      "password": pass
    };
    Map<String, String>  headers = {
      "Content-Type" : "application/json"
    };
    final url = Uri.https(baseUrl, '/api/auth/login');
    final body = json.encode(request);
    final response = await client.post( 
      url, 
      headers: headers, 
      body: body,
      );
    return await Isolate.run(() {
      if (response.statusCode == 200) {
        var value = AuthResponse.fromJson(jsonDecode(response.body));
        return value.data.token;
      } else {
        throw Exception("Failed to logIn");
      }
    });
  }
}