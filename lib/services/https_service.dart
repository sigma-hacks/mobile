import 'dart:convert';
// import 'package:ekzh/services/entities/auth_entities.dart';
// import 'package:flutter/foundation.dart';
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
// {
//     "email": "test@mail.ru",
//     "password": "123qwe123"

// }
// <DataResponse<AuthResponse>>
  Future auth({required String email, required String pass}) {
    Map request = {
      "email": email,
      "password": pass
    };
    Map<String, String>  headers = {
      "Content-Type" : "application/json"
    };
    final url = Uri.https(baseUrl, '/api/auth/login');
    final body = json.encode(request);
    // compute((message) => null, message)
    final response = client.post( 
      url, 
      headers: headers, 
      body: body,
      );
    // final response = client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    return response;
  }

}