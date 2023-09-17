import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'register.freezed.dart';
part 'register.g.dart';

@freezed
class Register with _$Register {
  const factory Register ({
    required String id,
    required String name,
  }) = _Register;
  factory Register.fromJson(Map<String,Object?> json) 
      => _$RegisterFromJson(json);

}