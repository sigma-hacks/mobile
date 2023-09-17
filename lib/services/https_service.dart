import 'dart:convert';
import 'dart:async';
import 'package:ekzh/services/entities/auth_entities.dart';
import 'package:ekzh/services/entities/register_entities.dart';
import 'package:ekzh/services/reachability_service.dart';
import 'package:ekzh/services/token_service.dart';
import 'package:http/http.dart';
import 'package:retry/retry.dart';

enum AuthType {
  password, pin
}

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

  Future<String> auth({required String email, required String pass, required AuthType type}) async {
    Map request = {
      "login": email,
      "password": pass,
      "type": type == AuthType.password ? "password" : "pin",
    };
    Map<String, String>  headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Connection": "keep-alive",
      "Accept-Encoding": "gzip, deflate, br"
    };
    final url = Uri.https(_baseUrl, '$_api/auth/login');
    final body = json.encode(request);
    return retry(
      () async {
        final response = await _client.post( 
          url, 
          headers: headers, 
          body: body,
        );
        if (response.statusCode == 200) {
          var value = AuthResponse.fromJson(jsonDecode(response.body));
          final token = value.data.token;
          _tokenService.saveToken(token);
          return token;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    );
  }

  Future getRegistr({required DateTime lastUpdate}) async {

    // final token = await _tokenService.getToken();
    // if (token == null) {
    //   return Exception("There is no token");
    // }
 
    Map<String, String>  headers = {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer 8|viuPr682V3giZdfzFrvxETLS5PGJEcRJbzYYva3g9f099df8",
    };
    final url = Uri.https(_baseUrl, '$_api/cards');
    return retry(
      () async {
        final response = await _client.get( 
          url, 
          headers: headers, 
        );
        if (response.statusCode == 200) {
          var value = RegisterEntities.fromJson(jsonDecode(response.body));
          // var value = AuthResponse.fromJson(jsonDecode(response.body));
          // final token = value.data.token;
          // _tokenService.saveToken(token);
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    );
  }
}