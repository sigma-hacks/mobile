import 'dart:convert';
import 'dart:ffi';

import 'package:hive_flutter/hive_flutter.dart';

class DataResponse<T> {
  final Bool status;
  final List<String> message;
  final T data;

  DataResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) {
    return DataResponse(
      status: json['status'] as Bool,
      message: json['message'] as List<String>,
      data: json['data'] as T,
    );
  }

}

// {
//     "status": true,
//     "data": {
//         "token": "8|HYVJROSgjDOQeRkzNDS6nKlXZxhMzzViA8NjxTEf48d55126"
//     },
//     "message": [
//         "User login successfully."
//     ]
// }

class AuthResponse {
    final String token;

    AuthResponse({
      required this.token,
    });

    factory AuthResponse.fromJson(Map<String,dynamic> json) {
      return AuthResponse(
        token: json["token"] as String,
      );
    }
}

@HiveType(typeId: 0)
class PostsModel {
  @HiveField(0)
  final int? userId;
  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? body;

  PostsModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostsModel.fromMap(Map<String, dynamic> map) {
    return PostsModel(
      userId: map['userId'] != null ? map['userId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsModel.fromJson(String source) =>
      PostsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}