import 'package:ekzh/services/entities/tariff.dart';
import 'package:ekzh/services/entities/register.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@Freezed()
class Card with _$Card {
  @HiveType(typeId: 100, adapterName: 'CardAdapter')
  const factory Card({
    @HiveField(0) required int hash,
    @HiveField(1) required int birthdate,
    @HiveField(2) required int cardNumber,
    @HiveField(3) required int expirationDate,
    @HiveField(4) required Tariff tariff,
    @HiveField(5) required String name,
  }) = _Card;

  factory Card.fromRegister(
      Register register, Map<String, dynamic> names, List<Tariff> tariffs) {
    try {
      final tariff = tariffs.firstWhere((e) => register.tariffId == e.id,
          orElse: () => const Tariff(name: "Default", amount: 100, id: 0));
      return Card(
          hash: register.hash,
          birthdate: register.birthdate,
          cardNumber: register.cardNumber,
          expirationDate: register.expirationDate,
          tariff: tariff,
          name: names[register.hash.toString()] as String);
    } catch (e) {
      return Card(
          hash: 1,
          birthdate: 1,
          cardNumber: 1,
          expirationDate: 1,
          tariff: Tariff(name: "Default", amount: 100, id: 0),
          name: "1234");
    }
  }
}
