import 'dart:convert';
import 'dart:async';
import 'package:ekzh/services/entities/auth_entities.dart';
import 'package:ekzh/services/entities/pending_request.dart';
import 'package:ekzh/services/entities/register_entities.dart';
import 'package:ekzh/services/repository.dart';
import 'package:ekzh/services/token_service.dart';
import 'package:http/http.dart';
import 'package:retry/retry.dart';
import 'package:uuid/uuid.dart';

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
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
 
    Map<String, String>  headers = {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer $token",
    };
    final url = Uri.https(_baseUrl, '$_api/cards');
    return retry(
      () async {
        final response = await _client.get( 
          url, 
          headers: headers, 
        );
        if (response.statusCode == 200) {
          var value = RegisterEntities.fromJson(jsonDecode(response.body)['data']);
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
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    Map requestedBody = {
        "request_at": DateTime.now().toUtc().toString()
    };
    Map<String, String>  headers = {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer $token",
    };
    final body = json.encode(requestedBody);
    final url = Uri.https(_baseUrl, '$_api/shift/start');
    try {
    await retry(
      () async {
        
        final response = await _client.post( 
          url, 
          headers: headers,
          body: body 
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
    } catch (e) {
      if (e is TimeoutException) {
        final request = PendingRequest(url: url.toString(), body: body, headers: json.encode(headers), id: const Uuid().v4().toString());
        await Repository().savePendingRequest(request);
      }
    }
  }

  Future stopShift() async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    Map requestedBody = {
        "request_at": DateTime.now().toUtc().toString()
    };
    Map<String, String>  headers = {
      "Content-Type" : "application/json",
      "Accept": "application/json",
      "Authorization" : "Bearer $token",
    };
    final body = json.encode(requestedBody);
    final url = Uri.https(_baseUrl, '$_api/shift/stop');
    try {
    return retry(
      () async {
        final response = await _client.post( 
          url, 
          headers: headers,
          body: body
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
    } catch (e) {
      if (e is TimeoutException) {
        final request = PendingRequest(url: url.toString(), body: body, headers: json.encode(headers), id: const Uuid().v4().toString());
        await Repository().savePendingRequest(request);
      }
    }
  }

  // MARK: - route
  Future getStatus() async {
    return Future.delayed(Duration(seconds: 10), () {
      return "затычка";
    });
  }

  Future startRoute({required String vehicleNumber, required int busRouteId}) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    Map request = {
      "vehicle_number": vehicleNumber,
      "pos_lat": 12.83281,
      "pos_lng": 72.91239,
      "bus_route_id": busRouteId,
      "request_at": DateTime.now().toUtc().toString()
    };
    Map<String, String>  headers = {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer $token",
    };
    final body = json.encode(request);
    final url = Uri.https(_baseUrl, '$_api/shift/route/start');
    try {
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
    } catch (e) {
      if (e is TimeoutException) {
        final request = PendingRequest(url: url.toString(), body: body, headers: json.encode(headers), id: const Uuid().v4().toString());
        await Repository().savePendingRequest(request);
      }
    }
  }

  Future stopRoute() async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    Map request = {
      "request_at": DateTime.now().toUtc().toString()
    };
    Map<String, String>  headers = {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer $token",
    };
    final body = json.encode(request);
    final url = Uri.https(_baseUrl, '$_api/shift/route/stop');
    try {
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
    } catch (e) {
      if (e is TimeoutException) {
        final request = PendingRequest(url: url.toString(), body: body, headers: json.encode(headers), id: const Uuid().v4().toString());
        await Repository().savePendingRequest(request);
      }
    }
  }

  Future cardCheck(int cardNumber) async {
    final token = await _tokenService.getToken();
    if (token == null) {
      throw Exception("There is no token");
    }
    Map request = {
      "card_number": cardNumber,
      "request_at": DateTime.now().toUtc().toString(),
    };
    Map<String, String>  headers = {
      "Content-Type" : "application/json",
      "Authorization" : "Bearer $token",
    };
    final body = json.encode(request);
    final url = Uri.https(_baseUrl, '$_api/card/check');
    try {
    await retry(
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
    } catch (e) {
      if (e is TimeoutException) {
        final request = PendingRequest(url: url.toString(), body: body, headers: json.encode(headers), id: const Uuid().v4().toString());
        await Repository().savePendingRequest(request);
      }
    }
  }

  // MARK: - Discounts


  // MARK: - Pending requests
  Future sendPendingRequests(PendingRequest request) async {

    final body = request.body;
    Map<String,dynamic> headers = json.decode(request.headers);
    Map<String, String> finalHeaders =
      headers.map((key, value) => MapEntry(key, value.toString()));
    final url = Uri.parse(request.url);

    return retry(
      () async {
        final response = await _client.post( 
          url, 
          headers: finalHeaders,
          body: body,
        );
        if (response.statusCode == 200) {
          // var value = RegisterEntities.fromJson(jsonDecode(response.body));
          // var value = AuthResponse.fromJson(jsonDecode(response.body));
          // final token = value.data.token;
          // _tokenService.saveToken(token);
          
          var value = jsonDecode(response.body);
          await Repository().flushPendingRequest(request);
          return value;
        } else if (response.statusCode == 409) {
          await stopShift();
          throw TimeoutException("repeat");
        } else {
          throw Exception("Failed to logIn");
        }
      },
      maxAttempts: 3,
      retryIf: (e) => e is TimeoutException,
    );

  }

}