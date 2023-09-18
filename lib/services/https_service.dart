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
          await _tokenService.saveToken(token);
          return token;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    );
  }

  Future<RegisterEntities> getRegistr({required DateTime lastUpdate}) async {

    // final token = await _tokenService.getToken();
    // if (token == null) {
    //   return Exception("There is no token");
    // }
 
    Map<String, String>  headers = {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer 9|R49MGxe6kaNiI82lcqBMJXaQ7zd6Nn0HXuySPae603aa9f07",
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


  // MARK: - Shift
  Future startShift() async {
    // Map request = {
    //   "login": email,
    //   "password": pass,
    //   "type": type == AuthType.password ? "password" : "pin",
    // };
    Map<String, String>  headers = {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer 9|R49MGxe6kaNiI82lcqBMJXaQ7zd6Nn0HXuySPae603aa9f07",
    };
    // final body = json.encode(request);
    final url = Uri.https(_baseUrl, '$_api/shift/start');
    return retry(
      () async {
        final response = await _client.post( 
          url, 
          headers: headers, 
        );
        if (response.statusCode == 200) {
          // var value = RegisterEntities.fromJson(jsonDecode(response.body));
          // var value = AuthResponse.fromJson(jsonDecode(response.body));
          // final token = value.data.token;
          // _tokenService.saveToken(token);
          var value = jsonDecode(response.body);
          return value;
        } else if (response.statusCode == 409) {
          await stopShift();
          throw TimeoutException("temp");
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    );
  }

  Future stopShift() async {
    // Map request = {
    //   "login": email,
    //   "password": pass,
    //   "type": type == AuthType.password ? "password" : "pin",
    // };
    Map<String, String>  headers = {
      "Content-Type" : "application/json",
      "Accept": "application/json",
      "Authorization" : "Bearer 9|R49MGxe6kaNiI82lcqBMJXaQ7zd6Nn0HXuySPae603aa9f07",
    };
    // final body = json.encode(request);
    final url = Uri.https(_baseUrl, '$_api/shift/stop');
    return retry(
      () async {
        final response = await _client.post( 
          url, 
          headers: headers,
        );
        if (response.statusCode == 200) {
          // var value = RegisterEntities.fromJson(jsonDecode(response.body));
          // var value = AuthResponse.fromJson(jsonDecode(response.body));
          // final token = value.data.token;
          // _tokenService.saveToken(token);
          var value = jsonDecode(response.body);
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    );
  }

  // MARK: - route
  Future getStatus() async {
    return Future.delayed(Duration(seconds: 10), () {
      return "затычка";
    });
  }

  Future startRoute({required String vehicleNumber, required int busRouteId}) async {
    Map request = {
      "vehicle_number": vehicleNumber,
      "pos_lat": 12.83281,
      "pos_lng": 72.91239,
      "bus_route_id": busRouteId, // ID маршрута автобуса
      "request_at": "2023-09-18 02:32:11" // если запрос с опозданием
    };
    Map<String, String>  headers = {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer 9|R49MGxe6kaNiI82lcqBMJXaQ7zd6Nn0HXuySPae603aa9f07",
    };
    final body = json.encode(request);
    final url = Uri.https(_baseUrl, '$_api/shift/route/start');
    return retry(
      () async {
        final response = await _client.post( 
          url, 
          headers: headers,
          body: body,
        );
        if (response.statusCode == 200) {
          // var value = RegisterEntities.fromJson(jsonDecode(response.body));
          // var value = AuthResponse.fromJson(jsonDecode(response.body));
          // final token = value.data.token;
          // _tokenService.saveToken(token);
          var value = jsonDecode(response.body);
          return value;
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    );
  }

  Future stopRoute() async {
    Map request = {
      "request_at": "2023-09-18 02:32:11" // если запрос с опозданием
    };
    Map<String, String>  headers = {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer 9|R49MGxe6kaNiI82lcqBMJXaQ7zd6Nn0HXuySPae603aa9f07",
    };
    final body = json.encode(request);
    final url = Uri.https(_baseUrl, '$_api/shift/route/stop');
    return retry(
      () async {
        final response = await _client.post( 
          url, 
          headers: headers,
          body: body,
        );
        if (response.statusCode == 200) {
          // var value = RegisterEntities.fromJson(jsonDecode(response.body));
          // var value = AuthResponse.fromJson(jsonDecode(response.body));
          // final token = value.data.token;
          // _tokenService.saveToken(token);
          var value = jsonDecode(response.body);
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