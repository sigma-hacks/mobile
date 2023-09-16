import 'dart:convert';
import 'dart:async';
import 'dart:isolate';
import 'package:ekzh/services/entities/auth_entities.dart';
import 'package:ekzh/services/entities/user_entities.dart';
import 'package:ekzh/services/token_service.dart';
import 'package:http/http.dart';

class HttpsService {
  
  static final HttpsService _instance = HttpsService._internal();

  factory HttpsService() {
    return _instance;
  }

  HttpsService._internal() {
      // init logic
  }

  final _baseUrl = "mocard.ru";
  final _api = "/api";
  final _client = Client();
  final _tokenService = TokenService();

  Future<String> auth({required String email, required String pass}) async {
    Map request = {
      "email": email,
      "password": pass
    };
    Map<String, String>  headers = {
      "Content-Type" : "application/json"
    };
    final url = Uri.https(_baseUrl, '$_api/auth/login');
    final body = json.encode(request);
    final response = await _client.post( 
      url, 
      headers: headers, 
      body: body,
    );
    return await Isolate.run(() {
      if (response.statusCode == 200) {
        var value = AuthResponse.fromJson(jsonDecode(response.body));
        final token = value.data.token;
        _tokenService.saveToken(token);
        return token;
      } else {
        throw Exception("Failed to logIn");
      }
    });
  }
}