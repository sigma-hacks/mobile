import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'register.freezed.dart';
part 'register.g.dart';

// https://stackoverflow.com/questions/60383178/combine-freezed-hive
@Freezed()
@JsonSerializable()
class Register with _$Register {

    @HiveType(typeId: 30, adapterName: 'RegisterAdapter')
    const factory Register({
        @JsonKey(name: 'id')
        @HiveField(0)
        required String id,
        @JsonKey(name: 'name')
        @HiveField(1)
        required String name,
      }) = _Register;
}