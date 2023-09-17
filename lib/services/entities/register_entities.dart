import 'dart:core';

import 'package:ekzh/services/entities/register.dart';
import 'package:ekzh/services/entities/tariff.dart';

class RegisterEntities {
  final bool status;
  final List<Tariff> tariffs;
  final Map<String,dynamic> names;
  final List<Register> registers;

  RegisterEntities({
    required this.status,
    required this.tariffs,
    required this.names,
    required this.registers,
  });

  factory RegisterEntities.fromJson(Map<String, dynamic> json) {
    final tariffs = json['data']['tariffs'] as List<dynamic>;
    final finalTariffs = tariffs.map((e) => Tariff.fromJson(e)).toList();

    final registers = json['data']['cards'] as List<dynamic>;
    final finalRegisters = registers.map((e) => Register.fromList(e)).toList();

    final names = json['data']['names'] as Map<String,dynamic>;

    return RegisterEntities(
      status: json['status'] as bool,
      tariffs: finalTariffs,
      names: names,
      registers: finalRegisters,
    );
  }
}